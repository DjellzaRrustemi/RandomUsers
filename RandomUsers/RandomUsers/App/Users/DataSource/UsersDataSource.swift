//
//  UsersDataSource.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
import UIKit
protocol UsersDataSourceProtocol: class{
    func loadMoreData()
    func showUserDetails(user: Result)
}
final class UsersDataSource: NSObject, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate{
    
    //MARK: - Properties
    var users: [Result]?
    var delegate:UsersDataSourceProtocol?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(UserCell.self, for: indexPath)
        var favoriteUsers = UserDefaults.standard.array(forKey: "workoutFavorite") as? [String] ?? [String]()

        if let user = users?[indexPath.row] {
            cell.users = user
        }
        
        if favoriteUsers.contains(users?[indexPath.row].id?.value ?? "") {
          cell.starButton.setImage(UIImage(named: "star-filled"), for: .normal)
        } else {
          cell.starButton.setImage(UIImage(named: "star"), for: .normal)
        }
        
        cell.favButtonPressed = { [ weak self ] in
            if favoriteUsers.contains(self?.users?[indexPath.row].id?.value ?? "") {
                let removeIdx = favoriteUsers.lastIndex(where: {$0 == self?.users?[indexPath.row].id?.value ?? ""})
                favoriteUsers.remove(at: removeIdx!)

            cell.starButton.setImage(UIImage(named: "star"), for: .normal)
            } else {
            cell.starButton.setImage(UIImage(named: "star-filled"), for: .normal)
              favoriteUsers.append(self?.users?[indexPath.row].id?.value ?? "")
          }
          UserDefaults.standard.set(favoriteUsers, forKey: "workoutFavorite")
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedUser = users?[indexPath.row]{
            self.delegate?.showUserDetails(user: selectedUser)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currentOffset <= 10.0 {
            self.delegate?.loadMoreData()
        }
    }
}
