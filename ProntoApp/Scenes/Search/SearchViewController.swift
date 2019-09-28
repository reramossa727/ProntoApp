//
//  SearchViewController.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    
    var coordinator: SearchCoordinator!
    var viewModel: SearchViewModel!
    var searchBar: UISearchBar?
    

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    
}

// MARK: - UISearchResultsUpdating

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        searchBar = searchController.searchBar
        
        searchController.searchResultsController?.view.isHidden = false
       // searchController.searchBar.delegate = self
        
    }
    
}

