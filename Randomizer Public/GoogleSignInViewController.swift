//
//  GoogleSignInViewController.swift
//  Randomizer
//
//  Created by Sharell Scott on 9/4/23.
//

import GoogleAPIClientForREST
import GoogleSignIn
import UIKit

class GoogleSignInViewController: UIViewController, GIDSignInDelegate {
    

    private let scopes = [kGTLRAuthScopeYouTubeReadonly]
    private let service = GTLRYouTubeService()
    let signInButton = GIDSignInButton()
    
    let gSignIn_globals = GlobalsViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().scopes = scopes

        // Add the sign-in button.
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        let centerXConstraint = NSLayoutConstraint(item: signInButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: signInButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            gSignIn_globals.showAlert(title: "Authentication Error", message: error.localizedDescription, viewController: self)
            
            self.service.authorizer = nil
        } else {
            /*
             If the user was able to authenticate, configure the proper authorization & pass the authorization
             to the next storyboard.
            */
            self.service.authorizer = user.authentication.fetcherAuthorizer()
            
            let findVidVC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "findVideoSB") as! FindVideoViewController
            
            findVidVC1.findVidVC_service = service

            findVidVC1.modalPresentationStyle = .fullScreen
            present(findVidVC1, animated: true, completion: nil)
        }
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }

}
