//
//  IntroCoordinator.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/26/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation
import UIKit

class IntroCoordinator: Coordinator {
    
    var window: UIWindow
    var introViewController: IntroViewController!
    
    init(window: UIWindow) {
        self.window = window
        introViewController = getViewController(for: .intro, with: IntroViewController.typeName) as? IntroViewController
    }
    
     func start(listRest: [Results]) {
        theme()
        setRootViewController(introViewController)
    }
    
    func theme() {
        
        // UIBarButtonItem appearance
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: ProntoAppFont.roboto(.regular, size: 18)], for: UIControl.State())
 
        // UINavigationBar appearance
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font: ProntoAppFont.roboto(.medium, size: 20)]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: ProntoAppFont.roboto(.medium, size: 35)]
        UINavigationBar.appearance().barTintColor = ProntoAppColor.pink
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
        
    }

}

