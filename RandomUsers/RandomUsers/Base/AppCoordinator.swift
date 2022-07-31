//
//  AppCoordinator.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import UIKit
class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow
    var usersCoordinator: UsersCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        initializeUsers()
    }
    private func initializeUsers()
    {
        usersCoordinator = UsersCoordinator()
//        UsersCoordinator?.coordinatorDelegate = self
        usersCoordinator?.start()
        if let vc = usersCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }
}
