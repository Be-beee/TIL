//
//  PersistenceManager.swift
//  CoreDataPractice
//
//  Created by 서보경 on 2021/03/05.
//

// 참고1: https://zeddios.tistory.com/987
// 참고2: https://zeddios.tistory.com/989

import UIKit
import CoreData

struct Person {
    var name: String
    var phoneNumber: String
    var shortcutNumber: Int
}

class PersistenceManager {
    static var shared = PersistenceManager()
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved Error \(error.localizedDescription)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    @discardableResult
    func insertPerson(person: Person) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: self.context)
        
        if let entity = entity {
            let managedObject = NSManagedObject(entity: entity, insertInto: self.context)
            
            managedObject.setValue(person.name, forKey: "name")
            managedObject.setValue(person.phoneNumber, forKey: "phoneNumber")
            managedObject.setValue(person.shortcutNumber, forKey: "shortcutNumber")
            
            do {
                try self.context.save()
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
    }
    
    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        do {
            let fetchResult = try self.context.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @discardableResult
    func delete(object: NSManagedObject) -> Bool {
        self.context.delete(object)
        do {
            try self.context.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    @discardableResult
    func deleteAll<T: NSManagedObject>(request: NSFetchRequest<T>) -> Bool {
        let request: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try self.context.execute(delete)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func count<T: NSManagedObject>(request: NSFetchRequest<T>) -> Int? {
        do {
            let count = try self.context.count(for: request)
            return count
        } catch {
            return nil
        }
    }
}



