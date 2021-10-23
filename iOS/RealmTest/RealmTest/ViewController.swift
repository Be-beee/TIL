//
//  ViewController.swift
//  RealmTest
//
//  Created by 서보경 on 2021/10/23.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = " "
    @objc dynamic var age = 0
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    @IBAction func createData(_ sender: UIButton) {
        let person = Person()
        person.name = self.nameField!.text!
        person.age = Int(self.ageField!.text!)!
        
        try! realm.write {
            realm.add(person)
        }
    }
    
    @IBAction func deleteData(_ sender: UIButton) {
        print("Delete Data")
    }
    
    
    @IBAction func updateData(_ sender: UIButton) {
        print("Update Data")
    }
    
    
    @IBAction func readData(_ sender: UIButton) {
        let list = realm.objects(Person.self)
        var readResult = ""
        if list.count == 0 {
            resultLabel.text = readResult
        }
        
        for item in list {
            readResult += ", name=\(item.name), age=\(item.age)"
        }
        resultLabel.text = readResult
        
        // query
        let filterAge = 27
 
        let person = realm.objects(Person.self).filter("age > \(filterAge)")
        print(person.count)
    }
}

