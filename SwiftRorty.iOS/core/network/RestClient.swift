//
//  RestClient.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 26.02.2022.
//

import Foundation

import Combine

/// Provides access to the REST Backend
protocol RestClient {
    /// Retrieves a JSON resource and decodes it
    func get<T: Decodable, E: Endpoint>(_ endpoint: E) -> AnyPublisher<T, Error>

    /// Creates some resource by sending a JSON body and returning empty response
    func post<S: Encodable, E: Endpoint>(_ endpoint: E, using body: S)
        -> AnyPublisher<Void, Error>
}

class RestClientImpl: RestClient {
    private let session: URLSession

    init(sessionConfig: URLSessionConfiguration? = nil) {
        self.session = URLSession(configuration: sessionConfig ?? URLSessionConfiguration.default)
    }

    func get<T, E>(_ endpoint: E) -> AnyPublisher<T, Error> where T: Decodable, E: Endpoint {
        startRequest(for: endpoint, method: "GET", jsonBody: nil as String?)
            .tryMap { try $0.parseJson() }
            .eraseToAnyPublisher()
    }
    
    func post<S, E>(_ endpoint: E, using body: S)
        -> AnyPublisher<Void, Error> where S: Encodable, E: Endpoint
    {
        startRequest(for: endpoint, method: "POST", jsonBody: body)
            .map { _ in () }
            .catch { error -> AnyPublisher<Void, Error> in
                switch error {
                case RestClientErrors.noDataReceived:
                    // API's Post request doesn't return data back even with code 200
                    return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
                default:
                    return Fail<Void, Error>(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func startRequest<T: Encodable, S: Endpoint>(for endpoint: S,
                                                         method: String,
                                                         jsonBody: T? = nil)
        -> AnyPublisher<InterimRestResponse, Error> {
        var request: URLRequest

        do {
            request = try buildRequest(endpoint: endpoint, method: method, jsonBody: jsonBody)
        } catch {
            print("Failed to create request: \(String(describing: error))")
            return Fail(error: error).eraseToAnyPublisher()
        }

        print("Starting \(method) request for \(String(describing: request))")

        return session.dataTaskPublisher(for: request)
            .mapError { (error: Error) -> Error in
                print("Request failed: \(String(describing: error))")
                return RestClientErrors.requestFailed(error: error)
            }
            // we got a response, lets see what kind of response
            .tryMap { (data: Data, response: URLResponse) in
                let response = response as! HTTPURLResponse
                print("Got response with status code \(response.statusCode) and \(data.count) bytes of data")

                if response.statusCode == 400 {
                    throw RestClientErrors.requestFailed(code: response.statusCode)
                }
                return InterimRestResponse(data: data, response: response)
            }.eraseToAnyPublisher()
    }
    
    private func buildRequest<T: Encodable, S: Endpoint>(endpoint: S,
                                                         method: String,
                                                         jsonBody: T?) throws -> URLRequest {
        var request = URLRequest(url: endpoint.url, timeoutInterval: 10)
        request.httpMethod = method
        // if we got some data, we encode as JSON and put it in the request
        if let body = jsonBody {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                throw RestClientErrors.jsonDecode(error: error)
            }
        }
        return request
    }
    
    struct InterimRestResponse {
        let data: Data
        let response: HTTPURLResponse

        func parseJson<T: Decodable>() throws -> T {
            if data.isEmpty {
                throw RestClientErrors.noDataReceived
            }
            
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                print("Failed to decode JSON: \(error)", String(describing: error))
                throw RestClientErrors.jsonDecode(error: error)
            }
        }
    }

}
