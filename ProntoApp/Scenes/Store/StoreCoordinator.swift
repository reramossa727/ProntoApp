//
//  StoreCoordinator.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

class StoreCoordinator: Coordinator {
    var storeViewController: StoreViewController!
    var navigationController: UINavigationController!
    
    init() {
    }
    
     func start(listRest: [Results]) {
        storeViewController = getViewController(for: .store, with: StoreViewController.typeName) as? StoreViewController
        storeViewController.viewModel = StoreViewModel(listRest: listRest)
        storeViewController.coordinator = self
        storeViewController.tabBarItem = UITabBarItem(title: "", image: ProntoAppTabBar.store.image, tag: 0)
        
        
        navigationController = UINavigationController(rootViewController: storeViewController)
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        /*let searchCoordinator = SearchCoordinator(navigation: navigationController, params: [])
         newHomeViewController.setUpSearchBar(searchViewController: searchCoordinator.searchViewController)*/
    }
    
    
}
