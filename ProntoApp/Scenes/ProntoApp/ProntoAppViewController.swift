//
//  ProntoAppViewController.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

class ProntoAppViewController: UITabBarController {
    
    var coordinator: ProntoAppCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    
    @objc func goToHome() {
        coordinator.goToHome()
    }
    
}

