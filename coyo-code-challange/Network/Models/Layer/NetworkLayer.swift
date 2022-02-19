//
//  NetworkLayer.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import Foundation

public enum ApiError: Error {
    case invalidURL
    case noData
}

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

public struct RequestData {

    public let path: String
    public let method: RequestMethod
    public let queryParams: [String: Any?]?
    public let params: [String: Any?]?
    public let headers: [String: String]?

    public init (path: String,
                 method: RequestMethod = .get,
                 queryParams: [String: Any?]? = nil,
                 params: [String: Any?]? = nil,
                 headers: [String: String]? = nil) {
        self.path = path
        self.method = method
        self.queryParams = queryParams
        self.params = params
        self.headers = headers
    }
}

public protocol RequestType {
    associatedtype ResponseType: Codable
    var data: RequestData { get }
}

public extension RequestType {

    func execute(dispatcher: NetworkDispatcher = URLSessionNetworkDispatcher.shared,
                 onSuccess: @escaping (ResponseType) -> Void,
                 onError: @escaping (Error) -> Void ) {
        dispatcher.dispatch(
            request: self.data,
            onSuccess: { (responseData: Data) in
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                    DispatchQueue.main.async {
                        onSuccess(result)
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        onError(error)
                    }
                }
            },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        )
    }
}

public protocol NetworkDispatcher {
    func dispatch(request: RequestData, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void)
}

public struct URLSessionNetworkDispatcher: NetworkDispatcher {

    public static let shared = URLSessionNetworkDispatcher()

    private init() {}

    public func dispatch(request: RequestData, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: request.path) else {
            onError(ApiError.invalidURL)
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        do {
            if let params = request.params {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
            if let queryParams = request.queryParams {
                guard var components = URLComponents(string: url.absoluteString) else {
                    return
                }
                var queryItems: [URLQueryItem] = []

                for (name, value) in queryParams {
                    queryItems.append(URLQueryItem(name: name, value: value as? String))
                }

                components.queryItems = queryItems
                urlRequest = URLRequest(url: components.url ?? url)
            }
        } catch let error {
            onError(error)
            return
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }

            guard let _data = data else {
                onError(ApiError.noData)
                return
            }
            onSuccess(_data)
        }.resume()
    }
}
