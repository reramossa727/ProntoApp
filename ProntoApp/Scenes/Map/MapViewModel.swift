//
//  MapViewModel.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MapViewModel: BaseViewModel {
    let listRestaurant = Variable<[Results]>([])
    
     init(listRest: [Results]){
        super.init()
        listRestaurant.value = listRest
    }
}
