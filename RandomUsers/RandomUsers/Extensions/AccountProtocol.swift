//
//  AccountProtocol.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import Foundation
import UIKit

protocol AccountProtocol: AnyObject {
    func initMain()
}

class Account: NSObject {
    
    static let shared = Account()
    weak var delegate: AccountProtocol?
    
    func initMain()
    {
        self.delegate?.initMain()
    }

}
