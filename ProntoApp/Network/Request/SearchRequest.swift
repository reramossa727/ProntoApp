//
//  SearchRequest.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation

enum SearchRequest: Request {
    
    case getList
    
    var path: String {
        switch self {
        case .getList:
            return "maps/api/place/textsearch/json?query=restaurantes&key=AIzaSyB00BsWrcR6n1KBk8ap9_Zqm2GPYBtJbdk"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getList:
            return .get
        }
    }
    
    var parameters: RequestParameters {
        switch self {
        case .getList:
            return .url(nil)
        }
    }
    
    var headers: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var dataType: DataType {
        switch self {
        case .getList:
            return .Data
        }
    }
}

class SearchListTask: NetworkOperation {
    init() {}
    
    var request: Request {
        return SearchRequest.getList
    }
    
    func execute(in dispatcher: Dispatcher, completion: @escaping (MainResponse?)->()) {
        do {
            try dispatcher.execute(request: self.request, completion: { (response) in
                switch response {
                case .data(let jsonData):
                    
                    let mainResponse = try? JSONDecoder().decode(MainResponse.self, from: jsonData)
                    completion(mainResponse)
                    
                case .json(_):
                    completion(nil)
                case .error(_, let error):
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    completion(nil)
                }
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

