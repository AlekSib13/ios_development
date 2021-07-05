//
//  Friends.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 03.07.2021.
//

import Foundation


import UIKit



protocol FriendDataSource {
    var id: UInt {get}
    var firstName: String {get}
    var lastName: String {get}
    var avatar: UIImage? {get}
    var birthday: String {get}
    var sex: String {get}
}

class Friend: FriendDataSource {
    var id: UInt
    var firstName: String
    var lastName: String
    var avatar: UIImage?
    var birthday: String
    var sex: String
    
    init(id: UInt, firstName: String, lastName: String, avatar: UIImage?, birthday: String, sex: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.birthday = birthday
        self.sex = sex
        
    }
}
