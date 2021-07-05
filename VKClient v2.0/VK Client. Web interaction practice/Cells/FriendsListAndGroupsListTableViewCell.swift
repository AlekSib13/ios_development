//
//  FriendsListAndGroupsListTableViewCell.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 04.07.2021.
//

import UIKit

class FriendsListAndGroupsListTableViewCell: UITableViewCell {
    
    let session = Singleton.shared.session!

    
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var avatar: UIImageView!
    
    func setUpCell() {
        avatar.layer.cornerRadius = 20.0
        
    }
    
    func clearCell() {
        avatar.image = nil
        firstName.text = nil
        lastName.text = nil
    }
    
    
    
    func configureCell(firstName: String, lastName: String?, avatar: UIImage?) {
        self.firstName.text = firstName
        
        let secondName = lastName ?? ""
        self.lastName.text = secondName
        
        guard let avatarImage = avatar else {return}
        self.avatar.image = avatarImage
    }
        
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
        setUpCell()
    }
}
