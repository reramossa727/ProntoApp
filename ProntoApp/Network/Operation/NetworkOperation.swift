//
//  NetworkOperation.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation

protocol NetworkOperation {
    associatedtype Output
    var request: Request { get }
    
    func execute(in dispatcher: Dispatcher, completion: @escaping (Output)->())
}
