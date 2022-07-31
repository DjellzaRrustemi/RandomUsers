//
//  UserDetailsViewModel.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
class UserDetailsViewModel: UserDetailsViewModelProtocol{
    weak var coordinatorDelegate : UserDetailsViewModelCoordinatorDelegate?
    var user:Result?

    public init(user: Result?){
        self.user = user
    }
}
