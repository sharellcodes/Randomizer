//
//  DisplayTextViewController.swift
//  BigTest
//
//  Created by Sharell Scott on 10/21/23.
//

import UIKit

class DisplayTextViewController: UIViewController {
    
    var locationText = String()
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isStringOnlyNumbersLettersAndPeriods(string: locationText) == true {
            locationLabel.text = locationText
        }
        else {
            locationLabel.text = "Didn't Work"
        }

        // Do any additional setup after loading the view.
    }
    
    func checkLocation(string: String) -> Bool {
        let specialCharacters2 = #"~`@#$%^*()_+={}[]|\\:;“‘<>/?!"#

        if (string.rangeOfCharacter(from: CharacterSet(charactersIn: specialCharacters2)) != nil) {
            return true
        }
        return false
    }
    
    func isStringOnlyNumbersLettersAndPeriods(string: String) -> Bool {
      let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9., ]+$", options: .caseInsensitive)
      let range = regex.firstMatch(in: string, range: NSRange(location: 0, length: string.count))
      return range != nil
    }
    
    
    @IBAction func TestingPush(_ sender: Any) {
        if locationLabel.text == "Didn't Work" {
            let ogView = ViewController()
            self.navigationController?.pushViewController(ogView, animated: true)
        }
        else {
            let testPush = TestPushViewController()
            testPush.ugh = "Hewwo"
            self.navigationController?.pushViewController(testPush, animated: true)
        }
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
