//
//  Restaurant.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation
import UIKit
// Lab 6: TODO: add MapKit framework --> import MapKit
import MapKit

class Restaurant {
    
    // ––––– Lab 2 TODO: Establish Properties –––––
    var imageURL: URL?
    var url: URL?
    var name: String
    var mainCategory: String
    var phone: String
    var rating: Double
    var reviews: Int
    // MARK: Lab 6:  Refactor Restaurant Model
    var coordinates: [String:Double]
    
    // ––––– Lab 2 TODO: Complete initializer for Restaurant
    init(dict: [String: Any]) {
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        rating = dict["rating"] as! Double
        reviews = dict["review_count"] as! Int
        phone = dict["display_phone"] as! String
        url = URL(string: dict["url"] as! String)
        mainCategory = Restaurant.getMainCategory(dict: dict)
        // LAB 6
        coordinates = dict["coordinates"] as! [String:Double]
    }
    
    // Helper function to get First category from restaurant
    static func getMainCategory(dict: [String:Any]) -> String {
        let categories = dict["categories"] as! [[String: Any]]
        return categories[0]["title"] as! String
    }

    
}
