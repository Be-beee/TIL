//
//  ViewController.swift
//  RealmTest
//
//  Created by 서보경 on 2021/10/23.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = "rrrr"
    @objc dynamic var age = 30
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var realm: Realm!
    var itemlist = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let list = realm.objects(Person.self)
        self.itemlist = Array(list)
        self.resultLabel.text = itemlist.description
    }

    @IBAction func createData(_ sender: UIButton) {
        let person = Person()
        guard let name = self.nameField.text, let age = self.ageField.text else { return }
        guard !name.isEmpty, !age.isEmpty else { return }
        person.name = name
        person.age = Int(age) ?? 0
        
        try! realm.write {
            realm.add(person)
        }
    }
    
    @IBAction func deleteData(_ sender: UIButton) {
        try! realm.write {
            realm.delete(self.itemlist[0])
        }
    }
    
    
    @IBAction func updateData(_ sender: UIButton) {
        print("Update Data")
    }
    
    
    @IBAction func readData(_ sender: UIButton) {
        let list = realm.objects(Person.self)
        
        if list.count == 0 {
            resultLabel.text = "no items"
        }
        self.itemlist = Array(list)
        self.resultLabel.text = self.itemlist.description
        
        // query
        let filterAge = 27
 
        let person = realm.objects(Person.self).filter("age > \(filterAge)")
        print(person.count)
    }
}

