//
//  FriendsListViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 03.07.2021.
//

import UIKit

class UserFriendsListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var friendsList: UITableView!
    
    let cellFriendsListIdentifier = "friendsListTableViewCellIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        friendsList.dataSource = self
        friendsList.register(UINib(nibName: "FriendsListAndGroupsListTableViewCell", bundle: nil), forCellReuseIdentifier: cellFriendsListIdentifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Singleton.shared.listOfUserFriends.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellFriendsListIdentifier, for: indexPath)
        
        guard let cellInfo = cell as? FriendsListAndGroupsListTableViewCell else {return UITableViewCell()}
        cellInfo.configureCell(firstName: Singleton.shared.listOfUserFriends[indexPath.row].firstName, lastName: Singleton.shared.listOfUserFriends[indexPath.row].lastName, avatar: Singleton.shared.listOfUserFriends[indexPath.row].avatar)
        
        return cellInfo
    }
}



