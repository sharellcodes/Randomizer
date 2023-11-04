//
//  GetLocationViewController.swift
//  Randomizer
//
//  Created by Sharell Scott on 10/21/23.
//

import UIKit
import GoogleAPIClientForREST

class GetLocationViewController: UIViewController {
    
    var getLocationVC_service = GTLRYouTubeService()
    var getLocationGlobals = GlobalsViewController()
    
    let specialCharacters = "~`@#$%^*()_+={}[]|\\:;“‘<>/?!"
    
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /*
     Check that the location that the user entered in the UITextField doesn't
     contain special characters
    */
    
    func locationIsValid(string: String) -> Bool {
      let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9., ]+$", options: .caseInsensitive)
      let range = regex.firstMatch(in: string, range: NSRange(location: 0, length: string.count))
      return range != nil
    }
    
    // "I'm Ready!"
    @IBAction func goToFindRes(_ sender: Any) {
        if locationIsValid(string: locationTextField.text!) == true {
            /*
             if the location doesn't contain special characters, pass the Google authorization
             and the location to the next storyboard.
            */
            let findResVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "findResSB") as! FindRestaurantViewController
            
            findResVC.location = locationTextField.text!
            findResVC.findResService = getLocationVC_service
            
            findResVC.modalPresentationStyle = .fullScreen
            present(findResVC, animated: true, completion: nil)
        }
        else {
            // Otherwise, let the user know that they need to enter a valid location format.
            let message = "Please enter a location that doesn't include the following: \(specialCharacters). Please also make sure that you actually enter a location."
            
            getLocationGlobals.showAlert(
                title: "Incorrect location format",
                message: message,
                viewController: self)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        }
    }
    */

}
