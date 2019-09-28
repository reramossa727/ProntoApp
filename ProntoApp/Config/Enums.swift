//
//  Enums.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/26/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation
import UIKit


enum ProntoAppStoryboard: String {
    
    case intro = "Intro"
    case map = "Map"
    case store = "Store"
    case categories = "Categories"
    case search = "Search"
}

enum ProntoAppTabBar: String {
    
    case map
    case store
    case categories
    
    var image: UIImage? {
        return UIImage(named: rawValue)
    }
    
}


