//
//  Model.swift
//  Contacts
//
//  Created by Aleksandr Malinin on 20.06.2021.
//

import Foundation



// MARK: Contact entity
protocol ContactProtocol {
    var name: String {get set}
    var phone: String {get set}
}


struct Contact: ContactProtocol {
    var name: String
    var phone: String
}



// MARK: Contact storage
protocol ContactStorageProtocol {
    func load() -> [ContactProtocol]
    func save(contacts: [ContactProtocol])
}


class ContactStorage: ContactStorageProtocol {
    private var storage = UserDefaults.standard
    private var storageKey = "contacts"
    
    
    private enum ContactKey: String {
        case title
        case phone
    }
    
    
    func load() -> [ContactProtocol] {
        var resultContacts: [ContactProtocol] = []
        let contactFromStorage = storage.array(forKey: storageKey) as? [[String:String]] ?? []
        
        for contact in contactFromStorage {
            guard let name = contact[ContactKey.title.rawValue], let phone = contact[ContactKey.phone.rawValue] else {continue}
            resultContacts.append(Contact(name: name, phone: phone))
        }
        
        return resultContacts
    }
    
    
    func save(contacts: [ContactProtocol]) {
        var arrayForStorage: [[String:String]] = []
        contacts.forEach{
            contact in
            var newElementForStorage: Dictionary<String, String> = [:]
            newElementForStorage[ContactKey.title.rawValue] = contact.name
            newElementForStorage[ContactKey.phone.rawValue] = contact.phone
            arrayForStorage.append(newElementForStorage)
        }
        storage.set(arrayForStorage, forKey: storageKey)
    }
}
