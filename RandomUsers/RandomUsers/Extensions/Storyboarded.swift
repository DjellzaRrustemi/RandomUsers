//
//  Storyboarded.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
import UIKit
protocol Storyboarded {
    static func instantiate(_ storyboard: UIStoryboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(_ storyboard: UIStoryboard) -> Self {
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
}

extension UIStoryboard {
    static var users: UIStoryboard {
        return UIStoryboard(name: "Users", bundle: nil)
    }
    static var userDetails: UIStoryboard {
        return UIStoryboard(name: "UserDetails", bundle: nil)
    }
}

extension UIStoryboard {
    func instantiate<T: UIViewController>(_ : T.Type, identifier: String? = nil) -> T {
        return self.instantiateViewController(withIdentifier: identifier ?? String(describing: T.self)) as! T
    }
}
