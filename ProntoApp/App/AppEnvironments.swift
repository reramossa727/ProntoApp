//
//  AppEnvironments.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation

class AppEnvironments {
    static let shared = AppEnvironments()
    private init() {}
    
    let prod = Environment("PROD", host: "")
    let qa = Environment("QA", host: "https://maps.googleapis.com")
}

