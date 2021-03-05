//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by 서보경 on 2021/03/05.
//

import UIKit
import CoreData

// 참고: https://zeddios.tistory.com/987

struct Person {
    var name: String
    var phoneNumber: String
    var shortcutNumber: Int
}

class ViewController: UIViewController {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved Error \(error.localizedDescription)")
            }
        })
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        saveData()
        fetchData()
    }
    
    func saveData() {
        let bebeee = Person(name: "bebeee", phoneNumber: "010-1111-1111", shortcutNumber: 1)
        
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context)
        
        if let entity = entity {
            let person = NSManagedObject(entity: entity, insertInto: context)
            person.setValue(bebeee.name, forKey: "name")
            person.setValue(bebeee.phoneNumber, forKey: "phoneNumber")
            person.setValue(bebeee.shortcutNumber, forKey: "shortcutNumber")
            
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func fetchData() {
        let context = persistentContainer.viewContext
        
        do {
            let contact = try context.fetch(Contact.fetchRequest()) as! [Contact]
            contact.forEach { print($0.name ?? "None") }
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

