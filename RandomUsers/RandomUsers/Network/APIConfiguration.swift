//
//  APIConfiguration.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
