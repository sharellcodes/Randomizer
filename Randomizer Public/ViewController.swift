//
//  ViewController.swift
//  Randomizer
//
//  Created by Sharell Scott on 9/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // "Literally Anything"
    @IBAction func goToRandomVC(_ sender: Any) {
        
        let randomVC_id = ["googleSignIn", "findRandomFood"].randomElement()
        
        if randomVC_id == "googleSignIn" {
            performSegue(withIdentifier: "start_YT", sender: self)
        }
        else if randomVC_id == "findRandomFood" {
            performSegue(withIdentifier: "start_food", sender: self)
        }
    }
}

