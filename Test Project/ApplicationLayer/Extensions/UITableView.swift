//
//  UITableView.swift
//  Test Project
//
//  Created by user2 on 7/31/20.
//  Copyright © 2020 maedeh. All rights reserved.
//

import UIKit

public extension UITableView {
    
    
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.allowsSelection = false
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
