//
//  UserDetailsCoordinator.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
import UIKit

class UserDetailsCoordinator: PushCoordinator{
    var configuration: ((UserDetailsViewController) -> ())?
    var viewController : UserDetailsViewController?
    var navigationController: UINavigationController?
    var viewModel : UserDetailsViewModelProtocol
    
    init(viewModel: UserDetailsViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
//        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = UserDetailsViewController.instantiate(.userDetails)
        self.viewController?.viewModel = viewModel
    }
}
