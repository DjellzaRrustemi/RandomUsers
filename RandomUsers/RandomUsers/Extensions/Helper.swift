//
//  Helper.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import UIKit
func delay(delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

func dispatch(_ closure: @escaping ()->()) {
    DispatchQueue.main.async {
        closure()
    }
}
