//
//  StoreViewModel.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

enum TableCartridge {
    
    case search(result: Results)
    
    func height() -> CGFloat {
        switch self {
        case .search:
            return 150
        }
    }
}


class StoreViewModel: BaseViewModel {
    
    let tableHome = Variable<[TableCartridge]>([])
     let listRestaurant = Variable<[Results]>([])
    
    init(listRest: [Results]) {
        super.init()
        listRestaurant.value = listRest
        update()
    }
    
    
    func update() {
        listRestaurant.value.forEach{
            tableHome.value.append(.search(result: $0))
        }
    }
}
