//
//  UsersViewModel.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
protocol UsersViewModelViewDelegate:class {
    func loadMoreData()
}
class UsersViewModel: UsersViewModelProtocol{
    weak var coordinatorDelegate : UsersViewModelCoordinatorDelegate?
    var dataSource: UsersDataSource?
    var viewDelegate: UsersViewModelViewDelegate?
    
    public init(){
        self.dataSource = UsersDataSource()
        self.dataSource?.delegate = self
    }

    
    func getUsers(users: [Result]?) {
        dataSource?.users = users
    }
    
    //API
    func getUsers(pagnation:String, results:String, completion: @escaping ((GetRandomUsers?) -> Void)) {
        let user = RandomUserClient.getRandomUsers(pagination: pagnation, results: results)
        user.execute(onSuccess: { user in
            completion(user)
         }, onFailure: {error in
            completion(nil)
         })
    }
}
extension UsersViewModel: UsersDataSourceProtocol{
    func loadMoreData() {
        self.viewDelegate?.loadMoreData()
    }
}
