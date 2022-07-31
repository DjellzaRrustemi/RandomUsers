//
//  RandomUserClient.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Alamofire
import PromisedFuture

class RandomUserClient {
    static func getRandomUsers(pagination: String, results: String)  -> Future<GetRandomUsers, Error> {
        return APIClient.performRequest(route:RandomUserEndpoint.getRandomUsers(pagination: pagination, results: results))
    }
}
