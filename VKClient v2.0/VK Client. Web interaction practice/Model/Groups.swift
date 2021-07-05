//
//  Groups.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 02.07.2021.
//

import Foundation
import UIKit


protocol GroupDataSource {
    var id: UInt {get}
    var name: String {get}
    var avatar: UIImage? {get}
}

class Group: GroupDataSource {
    let id: UInt
    var name: String
    var avatar: UIImage?
    
    init(id: UInt, name: String, avatar: UIImage?) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
}
