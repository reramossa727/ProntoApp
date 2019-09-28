//
//  ProntoAppCoordinator.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

class ProntoAppCoordinator: Coordinator {
    
    let prontoAppViewController: ProntoAppViewController
    let mapCoordinator: MapCoordinator
    let storeCoordinator: StoreCoordinator
    let categoriesCoordinator: CategoriesCoordinator
    
    init(listRest: [Results]) {
        prontoAppViewController = ProntoAppViewController()
        var controllers: [UIViewController] = []
        
        mapCoordinator = MapCoordinator()
        mapCoordinator.start(listRest: listRest)
        controllers.append(mapCoordinator.navigationController)
        
        storeCoordinator = StoreCoordinator()
        storeCoordinator.start(listRest: listRest)
        controllers.append(storeCoordinator.navigationController)
        
        categoriesCoordinator = CategoriesCoordinator()
        categoriesCoordinator.start(listRest: listRest)
        controllers.append(categoriesCoordinator.navigationController)
        
      
        prontoAppViewController.coordinator = self
        prontoAppViewController.viewControllers = controllers
        prontoAppViewController.tabBar.tintColor = ProntoAppColor.pink
        prontoAppViewController.tabBar.unselectedItemTintColor = .black
        prontoAppViewController.tabBar.barTintColor = .white
        
        if let items = prontoAppViewController.tabBar.items {
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
    }
    
     func start(listRest: [Results]) {
        setRootViewController(prontoAppViewController)
    }
    
}

extension ProntoAppCoordinator {
    
    
    
    
    func goToHome() {
        let presentedVC = (prontoAppViewController.presentedViewController as? UINavigationController)?.viewControllers.first
        
        presentedVC?.dismiss(animated: false, completion: {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let rootVC = appDelegate?.window?.rootViewController as? ProntoAppViewController
            let mapNavigation = rootVC?.coordinator.mapCoordinator.navigationController
            let storeNavigation = rootVC?.coordinator.storeCoordinator.navigationController
            let categoriesNavigation = rootVC?.coordinator.categoriesCoordinator.navigationController
            
            mapNavigation?.popToRootViewController(animated: false)
            storeNavigation?.popToRootViewController(animated: false)
            categoriesNavigation?.popToRootViewController(animated: false)
            
        })
    }
    
    
    
}

