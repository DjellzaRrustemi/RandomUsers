//
//  UsersViewModel.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
class UsersViewModel: UsersViewModelProtocol{
    weak var coordinatorDelegate : UsersViewModelCoordinatorDelegate?
    var dataSource: UsersDataSource?
    
    public init(){
        self.dataSource = UsersDataSource()
    }
}
