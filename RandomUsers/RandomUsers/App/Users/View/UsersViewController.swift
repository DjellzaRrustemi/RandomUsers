//
//  UsersViewController.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import UIKit

class UsersViewController: UIViewController, Storyboarded {
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel: UsersViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView(){
        tableView.register(UserCell.self)
        tableView.delegate = self.viewModel?.dataSource
        tableView.dataSource = self.viewModel?.dataSource
    }
}
