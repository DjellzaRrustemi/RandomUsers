//
//  APIConstants.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

struct APIConstants {
    struct DevelopmentServer {
        static let baseURL = "https://randomuser.me"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
