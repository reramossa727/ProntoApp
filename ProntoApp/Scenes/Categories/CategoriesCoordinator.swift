//
//  CategoriesCoordinator.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

class CategoriesCoordinator: Coordinator {
    var categoriesViewController: CategoriesViewController!
    var navigationController: UINavigationController!
    init() {
    }
    
     func start(listRest: [Results]) {
        categoriesViewController = getViewController(for: .categories, with: CategoriesViewController.typeName) as? CategoriesViewController
        categoriesViewController.viewModel = CategoriesViewModel()
        categoriesViewController.coordinator = self
        categoriesViewController.tabBarItem = UITabBarItem(title: "", image: ProntoAppTabBar.categories.image, tag: 0)
        
        
        navigationController = UINavigationController(rootViewController: categoriesViewController)
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        /*let searchCoordinator = SearchCoordinator(navigation: navigationController, params: [])
         newHomeViewController.setUpSearchBar(searchViewController: searchCoordinator.searchViewController)*/
    }
    
    
}
