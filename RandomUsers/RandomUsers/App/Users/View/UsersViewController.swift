//
//  UsersViewController.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
import UIKit

class UsersViewController: UIViewController, Storyboarded {
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel: UsersViewModelProtocol?
    var allResults = [Result]()
    var pagination:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        setupTableView()
        self.viewModel?.viewDelegate = self
    }
    

    //MARK: - functions
    func getUsers(){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getUsers(pagnation: "\(pagination)", results: "20" , completion: { [self] response in
            HIDE_CUSTOM_LOADER()
            if let res = response?.results {
                self.allResults.append(contentsOf: res)
                self.viewModel?.getUsers(users: allResults)
            }
            
            dispatch {
                self.tableView.reloadData()
            }
            pagination += 1
        })
    }
    
    func setupTableView(){
        tableView.register(UserCell.self)
        tableView.delegate = self.viewModel?.dataSource
        tableView.dataSource = self.viewModel?.dataSource
    }
}
extension UsersViewController: UsersViewModelViewDelegate {
    func showUserDetails(user: Result) {
        self.viewModel?.coordinatorDelegate?.showUserDetails(user: user)
    }
    func loadMoreData() {
        getUsers()
    }
}
