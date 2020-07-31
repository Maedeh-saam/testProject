//
//  String.swift
//  Test Project
//
//  Created by user2 on 7/31/20.
//  Copyright © 2020 maedeh. All rights reserved.
//

import Foundation

public extension String {
static func className(_ aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
}
