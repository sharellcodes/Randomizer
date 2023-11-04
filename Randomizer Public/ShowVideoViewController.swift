//
//  FindRandomViewController.swift
//  Randomizer
//
//  Created by Sharell Scott on 9/5/23.
//

import UIKit
import GoogleAPIClientForREST

class ShowVideoViewController: UIViewController {
    
    var showVideoVC_service = GTLRYouTubeService()
    let showVidGlobals = GlobalsViewController()
    
    var YTVideo_title = String()
    var YTChannel_title = String()
    var YT_thumbnail = String()
    var YT_url = String()
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var thumbnailLabel: UIImageView!
    @IBOutlet weak var channelTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        videoTitleLabel.text = YTVideo_title
        videoTitleLabel.sizeToFit()
        
        channelTitleLabel.text = YTChannel_title
        channelTitleLabel.sizeToFit()
        
        // Load video thumbnail to thumbnailLabel
        showVidGlobals.downloadImage(from: URL(string:YT_thumbnail)!, photo: thumbnailLabel)
        
        // Configure the UI objects to open YT_url when tapped
        for object in [videoTitleLabel, channelTitleLabel, thumbnailLabel] {
            let tap = UITapGestureRecognizer(target: self, action: #selector(onClickLabel(sender:)))
            object?.isUserInteractionEnabled = true
            object?.addGestureRecognizer(tap)
        }
        
    }
    
    // "Find another video"
    @IBAction func getAnotherVideo(_ sender: Any) {
        let findVidVC2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "findVideoSB") as! FindVideoViewController
        
        findVidVC2.findVidVC_service = showVideoVC_service
        
        findVidVC2.modalPresentationStyle = .fullScreen
        present(findVidVC2, animated: true, completion: nil)
    }
    
    // "Find a Restaurant Instead"
    @IBAction func getFood(_ sender: Any) {
        let getLocVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "getLocationSB") as! GetLocationViewController
        
        getLocVC.getLocationVC_service = showVideoVC_service
        
        getLocVC.modalPresentationStyle = .fullScreen
        present(getLocVC, animated: true, completion: nil)
    }
    
    // Configure the UI objects to open YT_url when tapped
    @objc func onClickLabel(sender:UITapGestureRecognizer) {
        
        let url = URL(string: YT_url)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
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
