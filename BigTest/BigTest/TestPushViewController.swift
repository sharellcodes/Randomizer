//
//  TestPushViewController.swift
//  BigTest
//
//  Created by Sharell Scott on 10/24/23.
//

import UIKit

class TestPushViewController: UIViewController {
    
    var ugh = String()
    
    @IBOutlet weak var testPushLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testPushLabel.text = ugh

        // Do any additional setup after loading the view.
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
