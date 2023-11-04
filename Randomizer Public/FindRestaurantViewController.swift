//
//  FindRestaurantViewController.swift
//  Randomizer
//
//  Created by Sharell Scott on 9/7/23.
//

import UIKit
import GoogleAPIClientForREST

class FindRestaurantViewController: UIViewController {
    
    var findResService = GTLRYouTubeService()
    let findResGlobals = GlobalsViewController()
    
    // enter your own api_key
    var location = String()
    let api_key = "insert key here"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // convert the location string to the proper URL encoding
        location = location.replacingOccurrences(of: " ", with: "%20")
        location = location.replacingOccurrences(of: ",", with: "%2C")
        location = location.replacingOccurrences(of: "&", with: "%26")
        
        let url = NSURL(string: "https://api.yelp.com/v3/businesses/search?location=\(String(describing: location))&term=food&open_now=true&limit=50")!
        getData(url: url)
    }
    
    func getData(url: NSURL) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer \(api_key)"
        ]

        let request = NSMutableURLRequest(url: url as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.findResGlobals.showAlert(
                        title: "Error - please restart the app",
                        message: error.localizedDescription,
                        viewController: self)
                }
                return
            }
            
            if let data = data {
                self.parseData(json: data)
            }
        })
        dataTask.resume()
    }
    
    func parseData(json: Data) {
        let decoder = JSONDecoder()
        
        // if the data returns restaurant information
        if let restaurants = try? decoder.decode(Restaurants.self, from: json) {
            let all_restaurants = restaurants.businesses
            let the_restaurant = all_restaurants.randomElement()
            
            // update UI from main thread
            DispatchQueue.main.async {
                let showResVC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "showResSB") as! ShowRestaurantViewController
                
                let addressDict = the_restaurant!.location.display_address
                
                showResVC1.resAddress = addressDict.joined(separator: "\n")
                showResVC1.resName = the_restaurant!.name
                showResVC1.resImageURL = the_restaurant!.image_url
                showResVC1.resURL = the_restaurant!.url
                showResVC1.showRestaurantVC_service = self.findResService
                
                showResVC1.modalPresentationStyle = .fullScreen
                self.present(showResVC1, animated: true, completion: nil)
            }
        }
        
        // if the data returns an error
        if let errors = try? decoder.decode(YelpError.self, from: json) {
            DispatchQueue.main.async {
                let message = "\(errors.error.description) Please restart the app to try again."
                self.findResGlobals.showAlert(
                    title: errors.error.code,
                    message: message,
                    viewController: self)
            }
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

struct Restaurants: Codable {
    var businesses: [Restaurant]
}

struct Restaurant: Codable {
    var image_url: String
    var location: Location
    var name: String
    var url: String
}

struct Location: Codable {
    var display_address: [String]
}

struct YelpError: Codable {
    var error: ErrorDetails
}

struct ErrorDetails: Codable {
    var code: String
    var description: String
}
