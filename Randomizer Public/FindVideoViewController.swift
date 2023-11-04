//
//  FindVideoViewController.swift
//  Randomizer
//
//  Created by Sharell Scott on 9/15/23.
//

import UIKit
import GoogleAPIClientForREST

class FindVideoViewController: UIViewController {
    
    var findVidVC_service = GTLRYouTubeService()
    let findVidGlobals = GlobalsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchPopVideoResource()
    }
    
    // Youtube Video list request
    func fetchPopVideoResource() {
        
        let videoSearch_query = GTLRYouTubeQuery_VideosList.query(withPart: "snippet")
        videoSearch_query.chart = "mostPopular"

        findVidVC_service.executeQuery(videoSearch_query,
                             delegate: self,
                             didFinish: #selector(getPopularVideo(ticket:finishedWithObject:error:)))
    }
    
    @objc func getPopularVideo(ticket: GTLRServiceTicket,
                              finishedWithObject response: GTLRYouTube_VideoListResponse,
                              error: NSError?) {
        
        if let error = error {
            findVidGlobals.showAlert(
                title: "Error - please restart the app",
                message: error.localizedDescription,
                viewController: self)
            return
        }
        
        var video = GTLRYouTube_Video()
        
        // update the UI from the main thread
        DispatchQueue.main.async {
            let showVidVC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "showVidSB") as! ShowVideoViewController
            
            if let videos = response.items, !videos.isEmpty {
                video = videos.randomElement()!
                
                showVidVC1.YT_thumbnail = (video.snippet?.thumbnails?.high?.url)!
                showVidVC1.YTVideo_title = (video.snippet?.title)!
                showVidVC1.YTChannel_title = (video.snippet?.channelTitle)!
                showVidVC1.YT_url = "https://www.youtube.com/watch?v=\(video.identifier!)"
            }
            
            showVidVC1.showVideoVC_service = self.findVidVC_service
            
            showVidVC1.modalPresentationStyle = .fullScreen
            self.present(showVidVC1, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
