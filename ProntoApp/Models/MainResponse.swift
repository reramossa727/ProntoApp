//
//  MainResponse.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation

import Foundation
struct MainResponse : Codable{
    //let html_attributions : [String]
    //let next_page_token : String
    let results : [Results]?
    //let status : String?
    
}

/*extension MainResponse {
    enum CodingKeys: String, CodingKey {
        
        case html_attributions
        case next_page_token
        case results
        case status
    }
}*/
