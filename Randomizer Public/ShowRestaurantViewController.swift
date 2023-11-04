//
//  ShowRestaurantViewController.swift
//  Randomizer
//
//  Created by Sharell Scott on 10/18/23.
//

import UIKit
import GoogleAPIClientForREST

class ShowRestaurantViewController: UIViewController {
    
    var showRestaurantVC_service = GTLRYouTubeService()
    let showResGlobals = GlobalsViewController()
    
    @IBOutlet weak var restaurant_name: UILabel!
    @IBOutlet weak var restaurant_address: UILabel!
    @IBOutlet weak var restaurant_photo: UIImageView!
    
    var resName = String()
    var resAddress = String()
    var resImageURL = String()
    var resURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        restaurant_name.text = resName
        restaurant_name.sizeToFit()
        
        restaurant_address.text = resAddress
        restaurant_address.sizeToFit()
        
        // Load video thumbnail to thumbnailLabel
        showResGlobals.downloadImage(from: URL(string: resImageURL)!, photo: restaurant_photo)
        
        // Configure the UI objects to open resURL when tapped
        for object in [restaurant_name, restaurant_address, restaurant_photo] {
            let tap = UITapGestureRecognizer(target: self, action: #selector(onClickLabel(sender:)))
            object?.isUserInteractionEnabled = true
            object?.addGestureRecognizer(tap)
        }
    }
    
    // Configure the UI objects to open resURL when tapped
    @objc func onClickLabel(sender:UITapGestureRecognizer) {
        
        let url = URL(string: resURL)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    // "Find a Youtube Video Instead"
    @IBAction func findYTVideo(_ sender: Any) {
        if showRestaurantVC_service.authorizer?.canAuthorize == true {
            // if the Google authorization has already been configured, pass the authorization to the next storyboard
            let findVidVC3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "findVideoSB") as! FindVideoViewController
            
            findVidVC3.findVidVC_service = showRestaurantVC_service
            
            findVidVC3.modalPresentationStyle = .fullScreen
            present(findVidVC3, animated: true, completion: nil)
        } else {
            // if the Google authorization hasn't already been configured, go to the Sign In page to authorize
            let googleSignInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "googleSignInSB") as! GoogleSignInViewController
            
            googleSignInVC.modalPresentationStyle = .popover
            present(googleSignInVC, animated: true, completion: nil)
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
