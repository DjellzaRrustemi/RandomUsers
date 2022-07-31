//
//  UsersViewModelProtocol.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
import Foundation

protocol UsersViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : UsersViewModelCoordinatorDelegate? {get set}
    var dataSource : UsersDataSource? {get}
}
