//
//  Location.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation
struct Location : Codable  {
    let lat : Double?
    let lng : Double?
    
}

//extension Location : Codable {
//    enum CodingKeys: String, CodingKey {
//        case lat
//        case lng
//    }
//}
