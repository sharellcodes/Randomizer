//
//  ViewController.swift
//  BigTest
//
//  Created by Sharell Scott on 10/18/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testUIText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "goToDisplay") {
            let DVC = segue.destination as! DisplayTextViewController
            DVC.locationText = testUIText.text!

        }
    }

}

