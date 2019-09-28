//
//  IntroViewModel.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class IntroViewModel: BaseViewModel {
    let listRestaurant = Variable<[Results]>([])
    
    override init(){
        super.init()
        self.update()
    }
    
    func update() {
        
        let dispatcher = NetworkDispatcher(environment: AppEnvironments.shared.qa)
        let prontoTask = SearchListTask()
        prontoTask.execute(in: dispatcher) { [weak self] (MainResponse) in
            
            MainResponse?.results?.forEach{
                self?.listRestaurant.value.append($0)
            }
            
        }
    }
    
}

