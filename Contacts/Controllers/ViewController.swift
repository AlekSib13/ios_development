//
//  ViewController.swift
//  Contacts
//
//  Created by Aleksandr Malinin on 20.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var userDeafaults = UserDefaults.standard

    var storage: ContactStorageProtocol!
    
    var contacts: [ContactProtocol] = [] {
        didSet {
            contacts.sort{$0.name < $1.name}
            storage.save(contacts: contacts)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        storage = ContactStorage()
        loadContact()
    }
}

// MARK: ViewController extension to TableView DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            cell = reusedCell} else {cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")}
        
        configure(cell: &cell, for: indexPath)
        return cell
    }
}


// MARK: configuring a cell
extension ViewController {
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = contacts[indexPath.row].name
        configuration.secondaryText = contacts[indexPath.row].phone
        cell.contentConfiguration = configuration
    }
}


// MARK: Loading saved data from UserDeafaults
extension ViewController {
    private func loadContact() {
        contacts = storage.load()
    }
}

// MARK: Deleting contact
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .destructive, title: "Delete") {_,_,_  in
            self.contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
    }
}

// MARK: Inserting new contact
extension ViewController {
    @IBAction func showContactAlert() {
        let alertController = UIAlertController(title: "Create new contact", message: "Insert name and phone number", preferredStyle: .alert)
        
        alertController.addTextField {someTextField in someTextField.placeholder = "Enter name"}
        alertController.addTextField {someTextField in someTextField.placeholder = "Enter phone"}
    
        let createButton = UIAlertAction(title: "Create", style: .default) {_ in guard let contactName = alertController.textFields?[0].text, let contactPhone = alertController.textFields?[1].text else {return}
            
            let contact = Contact(name: contactName, phone: contactPhone)
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(createButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
}


