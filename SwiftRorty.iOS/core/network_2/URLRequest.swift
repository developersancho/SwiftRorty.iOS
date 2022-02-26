//
//  URLRequest.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 26.02.2022.
//

import Foundation

extension URLRequest {
    private static let baseUrl = "https://rickandmortyapi.com/api/"
    
    init(_ endpoint: APIEndpoint,
         _ method: APIMethod,
         _ parameters: [String: Any?]? = nil) {
        let urlString = "\(URLRequest.baseUrl)\(endpoint.path)"
        let url = URL(string: urlString)!
        self.init(url: url)
        self.httpMethod = method.rawValue
        processParameters(method, parameters)
        self.timeoutInterval = 30
    }
    
    private mutating func processParameters(_ method: APIMethod, _ parameters: [String: Any?]? = nil) {
        switch method {
        case .get:
            processGetParameters(parameters)
        default:
            processPostParameters(parameters)
        }
    }
    
    private mutating func processPostParameters(_ parameters: [String: Any?]? = nil) {
        if let parameters = parameters, let jsonParameters = try? JSONSerialization.data(withJSONObject: parameters,
                                                                                         options: []) {
            self.httpBody = jsonParameters
        }
    }
    
    private mutating func processGetParameters(_ parameters: [String: Any?]? = nil) {
        guard let parameters = parameters, !parameters.isEmpty else { return }
        let queryParameters = parameters.reduce("?") { (result, element) -> String in
            guard let value = element.value else { return result }
            if result.count > 1 {
                return "\(result)&\(element.key)=\(value)"
            }
            return "\(result)\(element.key)=\(value)"
        }
        var queryCharSet = NSCharacterSet.urlQueryAllowed
        queryCharSet.remove(charactersIn: "+")
        if let url = self.url?.absoluteString,
            let urlQueryParameters = queryParameters.addingPercentEncoding(withAllowedCharacters: queryCharSet) {
            let urlWithParameters = "\(url)\(urlQueryParameters)"
            self.url = URL(string: urlWithParameters)!
        }
    }
}
