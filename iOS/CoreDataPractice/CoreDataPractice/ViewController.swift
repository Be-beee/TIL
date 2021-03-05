//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by 서보경 on 2021/03/05.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveData()
        fetchData()
        count()
        deleteData()
        fetchData()
        count()
    }
    
    func saveData() {
        let bebeee = Person(name: "bebeee", phoneNumber: "010-1111-1111", shortcutNumber: 1)
        let jasmine = Person(name: "jasmine", phoneNumber: "010-2222-2222", shortcutNumber: 2)
        
        PersistenceManager.shared.insertPerson(person: bebeee)
        PersistenceManager.shared.insertPerson(person: jasmine)
    }
    
    func fetchData() {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        let fetchResult = PersistenceManager.shared.fetch(request: request)
        fetchResult.forEach { print($0.name ?? "None") }
    }
    
    func deleteData() {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        let fetchResult = PersistenceManager.shared.fetch(request: request)
        PersistenceManager.shared.delete(object: fetchResult.last!)
    }
    
    func deleteAll() {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        PersistenceManager.shared.deleteAll(request: request)
        
        let arr = PersistenceManager.shared.fetch(request: request)
        if arr.isEmpty {
            print("clean")
        }
    }
    
    func count() {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        print(PersistenceManager.shared.count(request: request) ?? -1)
    }

}

