//
//  StoreViewController.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit
import RxSwift

class StoreViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            
            tableView.separatorStyle = .none
            tableView.showsVerticalScrollIndicator = false
            tableView.backgroundColor = .white
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.register(cellType: StoreTableViewCell.self)
        }
    }
    var coordinator: StoreCoordinator?
    var viewModel: StoreViewModel!
    
    var tableHome : [TableCartridge] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar("Tiendas")
    }
    
    override func observe() {
        
        viewModel.tableHome.asObservable().bind { [weak self] (tableHome) in
            self?.tableHome = tableHome
            }.disposed(by: disposeBag)
        
    }

}

//-----------------------------------------------------------------------------------
// MARK: - UITableViewDataSource

extension StoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableHome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homeCartridge = tableHome[indexPath.row]
        
        switch homeCartridge {
        case .search(let result):
            let cell = tableView.dequeueReusableCell(with: StoreTableViewCell.self, for: indexPath)
                cell.configure(result: result)
            return cell
       
        }
    }
}


// MARK: - UITableViewDelegate

extension StoreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeCartridge = tableHome[indexPath.row]
        
        switch homeCartridge {
           
         case .search( _): break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let homeCartridge = tableHome[indexPath.row]
        return homeCartridge.height()
    }
    
}
