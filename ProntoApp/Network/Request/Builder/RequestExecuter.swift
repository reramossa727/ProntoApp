//
//  RequestExecuter.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import Foundation

struct Environment {
    public var name: String
    public var host: String
    public var headers: [String: Any] = [:]
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    public init(_ name: String, host: String) {
        self.name = name
        self.host = host
    }
}

protocol Dispatcher {
    init(environment: Environment)
    func execute(request: Request, completion: @escaping (Response)->()) throws
}

enum NetworkErrors: Error {
    case badURL
    case badInput
    case noData
}

class NetworkDispatcher: Dispatcher {
    private var environment: Environment
    private var session: URLSession
    
    required public init(environment: Environment) {
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    public func execute(request: Request, completion: @escaping (Response)->()) throws {
        let rq = try self.prepareURLRequest(for: request)
        let d = self.session.dataTask(with: rq, completionHandler: { (data, urlResponse, error) in
            let response = Response( (urlResponse as? HTTPURLResponse, data, error), for: request)
            completion(response)
        })
        d.resume()
    }
    
    private func prepareURLRequest(for request: Request) throws -> URLRequest {
        // Compose the url
        let sUrl = "\(environment.host)/\(request.path)"
        guard let full_url = URL(string: sUrl) else {
            throw NetworkErrors.badURL
        }
        var url_request = URLRequest(url: full_url)
        
        // Working with parameters
        switch request.parameters {
        case .body(let params):
            // Parameters are part of the body
            if let params = params as? [String: String] { // just to simplify
                url_request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))
            } else {
                throw NetworkErrors.badInput
            }
        case .url(let params):
            // Parameters are part of the url
            if params == nil { break }
            if let params = params as? [String: String] { // just to simplify
                let query_params = params.map({ (element) -> URLQueryItem in
                    return URLQueryItem(name: element.key, value: element.value)
                })
                guard var components = URLComponents(string: sUrl) else {
                    throw NetworkErrors.badInput
                }
                components.queryItems = query_params
                url_request.url = components.url
            } else {
                throw NetworkErrors.badInput
            }
        }
        
        // Add headers from enviornment and request
        environment.headers.forEach { url_request.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { url_request.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        
        // Setup HTTP method
        url_request.httpMethod = request.method.rawValue
        
        return url_request
    }
}

