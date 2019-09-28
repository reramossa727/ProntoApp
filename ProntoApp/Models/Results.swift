//
//  Results.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//


import Foundation

struct Results : Codable{
    let formatted_address : String
    let geometry : Geometry?
    let icon : String?
    //let id : String?
    let name : String?
    //let place_id : String?
    //let plus_code : Plus_code?
    //let rating : Int?
    //let reference : String?
    //let types : [String]?
    //let user_ratings_total : Int?
}

//extension Results : Codable {
//    enum CodingKeys: String, CodingKey {
//
//        case formatted_address
//        case geometry
//        case icon
//        case id
//        case name
//        case place_id
//        case plus_code
//        case rating
//        case reference
//        case types
//        case user_ratings_total
//    }
//}
