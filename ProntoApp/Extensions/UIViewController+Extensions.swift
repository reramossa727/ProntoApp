//
//  UIViewController+Extensions.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/26/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    static var typeName: String {
        return String(describing: self)
    }
    
    func setUpNavigationBar(_ title: String) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = title
    }
    
    
    internal func setUpSearchBar(searchViewController: SearchViewController) {
        
        let searchController = UISearchController(searchResultsController: searchViewController)
        searchController.searchResultsUpdater = searchViewController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar productos"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barTintColor = .white
        //searchController.searchBar.backgroundImage = UIImage()
        let scb = searchController.searchBar
        if let textfield = scb.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.white
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
        }
        
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let view: UIView = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 60))
        view.backgroundColor = .cyan
        
    }
    
}

