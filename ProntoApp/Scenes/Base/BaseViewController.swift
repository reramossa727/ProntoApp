//
//  BaseViewController.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observe()
    }
    
    func observe() {
        fatalError("Implement")
    }
    
}

