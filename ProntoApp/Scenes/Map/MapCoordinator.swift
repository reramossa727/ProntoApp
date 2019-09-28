//
//  MapCoordinator.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

class MapCoordinator: Coordinator {
    var mapViewController: MapViewController!
    var navigationController: UINavigationController!
    
    init() {
    }
    
    func start(listRest: [Results]) {
        
        mapViewController = getViewController(for: .map, with: MapViewController.typeName) as? MapViewController
        mapViewController.viewModel = MapViewModel(listRest: listRest)
        mapViewController.coordinator = self
        mapViewController.listRest = listRest
        mapViewController.tabBarItem = UITabBarItem(title: "", image: ProntoAppTabBar.map.image, tag: 0)
        
        
        navigationController = UINavigationController(rootViewController: mapViewController)
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        let searchCoordinator = SearchCoordinator(navigation: navigationController)
        mapViewController.setUpSearchBar(searchViewController: searchCoordinator.searchViewController)
    }
    
    
}
