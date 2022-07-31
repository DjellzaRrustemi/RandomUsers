//
//  UsersCoordinator.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import UIKit

class UsersCoordinator: DefaultCoordinator{
    var viewController : UsersViewController?
    var viewModel : UsersViewModelProtocol
    
    init(viewModel: UsersViewModelProtocol = UsersViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = UsersViewController.instantiate(.users)
        self.viewController?.viewModel = self.viewModel
    }
}
extension UsersCoordinator:UsersViewModelCoordinatorDelegate{
}

