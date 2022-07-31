//
//  UserDetailsViewModelProtocol.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation

protocol UserDetailsViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : UserDetailsViewModelCoordinatorDelegate? {get set}
}
