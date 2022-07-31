//
//  RandomUserEndpoint.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import UIKit
import Alamofire

enum RandomUserEndpoint: APIConfiguration {
    case getRandomUsers(pagination:String, results:String)
   
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getRandomUsers:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .getRandomUsers(let pagination, let results):
            var urlComponents = URLComponents()
            urlComponents.path = "/api"
            urlComponents.queryItems = [URLQueryItem(name: "page", value: pagination), URLQueryItem(name: "results", value: results)]
            return urlComponents.url!.absoluteString
        }
    }
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .getRandomUsers:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let urlString =  APIConstants.DevelopmentServer.baseURL + path
        let finalURL = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        var urlRequest = URLRequest(url: finalURL!)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        print("urlRequest: \(urlRequest)")
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        // Authorization
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Parameters
        if let parameters = parameters {
            print(parameters)
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}


