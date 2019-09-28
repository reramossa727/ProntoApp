//
//  SearchCoordinator.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//


import UIKit

class SearchCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    weak var searchViewController: SearchViewController!
    
    init(navigation: UINavigationController) {
        
        navigationController = navigation
        
        searchViewController = getViewController(for: .search, with: SearchViewController.typeName) as? SearchViewController
        searchViewController.viewModel = SearchViewModel()
        
        
        searchViewController.coordinator = self
        
    }
    
     func start(listRest: [Results]) {
        navigationController.pushViewController(searchViewController, animated: true)
    }
    
}

