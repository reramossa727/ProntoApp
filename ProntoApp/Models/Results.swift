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
    let name : String?
}
