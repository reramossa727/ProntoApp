//
//  main.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation

struct mainAux {
    let mainResponse : MainResponse
    
}

extension mainAux : Codable{
    enum CodingKeys: String, CodingKey {
        case mainResponse
    }
}

