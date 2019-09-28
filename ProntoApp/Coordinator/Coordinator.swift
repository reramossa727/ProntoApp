//
//  Coordinator.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/26/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    func start(listRest: [Results])
}

extension Coordinator {
    
    func getViewController(for storyboard: ProntoAppStoryboard, with identifier: String) -> UIViewController? {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    func setRootViewController(_ viewController: UIViewController) {
        
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else {
            return
        }
        
        UIView.transition(with: window, duration: 0.4, options: .transitionCrossDissolve, animations: {
            window.rootViewController = viewController
        })
        
    }
    
}

