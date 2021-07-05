//
//  UserGroupsListViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 03.07.2021.
//

import UIKit

class UserGroupsListViewController: UIViewController,UITableViewDataSource {
    

    @IBOutlet weak var groupsList: UITableView!
    
    let cellGroupsListIdentifier = "groupsListTableViewCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsList.dataSource = self
        groupsList.register(UINib(nibName: "FriendsListAndGroupsListTableViewCell", bundle: nil), forCellReuseIdentifier: cellGroupsListIdentifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Singleton.shared.listOfUserGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellGroupsListIdentifier, for: indexPath)
        
        guard let cellInfo = cell as? FriendsListAndGroupsListTableViewCell else {return UITableViewCell()}
        cellInfo.configureCell(firstName: Singleton.shared.listOfUserGroups[indexPath.row].name, lastName: nil, avatar: Singleton.shared.listOfUserGroups[indexPath.row].avatar)
        
        return cellInfo
    }
}


