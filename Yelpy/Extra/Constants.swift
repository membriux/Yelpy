//
//  Constants.swift
//  Yelpy
//
//  Created by Memo on 7/1/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation

struct Segues {
    static let authenticated = "Authenticated"
    static let unwind = "Unwind"
}

struct Cells {
    
    static let ChatCell = "ChatCell"
    static let RestaurantCell = "RestaurantCell"
    
}


struct ParseServer {
    
    static let serverUrl = "http://45.79.67.127:1337/parse"
    static let appId = "CodePath-Parse"
    
}


struct ParseClass {
    
    static let TrainingFall2020 = "TrainingFall2020"
    
}

struct Notify {

    static let didLogOut = "didLogOut"
    static let isLoggedIn = "isLoggedIn"
    
}

struct VC {
    static let chatVC = "ChatViewController"
    static let loginVC = "LoginViewController"
    static let restaurantsVC = "RestaurantsViewController"
    static let tabBar = "TabBar"
}
