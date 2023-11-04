//
//  GlobalsViewController.swift
//  Randomizer
//
//  Created by Sharell Scott on 10/19/23.
//

import UIKit

class GlobalsViewController {
    
    // Helper function for alerting the user of an error
    func showAlert(title : String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        alert.addAction(ok)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func downloadImage(from url: URL, photo: UIImageView) {
        
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }

            // update the UI from the main thread
            DispatchQueue.main.async() {
                photo.image = UIImage(data: data)
            }
            
        })
        dataTask.resume()
    }

}
