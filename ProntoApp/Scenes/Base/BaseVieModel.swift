//
//  BaseVieModel.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import RxSwift
import RxCocoa

class BaseViewModel {
    
    let isSuccess = BehaviorRelay<Bool>(value: false)
    let isDeleting = BehaviorRelay<Bool>(value: false)
    let isLoading = BehaviorRelay<Bool>(value: false)
    let message: Variable<String> = Variable("")
    let disposeBag = DisposeBag.init()
    
}

