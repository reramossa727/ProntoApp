//
//  CategoriesViewController.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var coordinator: CategoriesCoordinator?
    var viewModel: CategoriesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar("Categorias")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
