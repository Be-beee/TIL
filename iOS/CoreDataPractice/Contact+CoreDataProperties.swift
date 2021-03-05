//
//  Contact+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by 서보경 on 2021/03/05.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var shortcutNumber: Int16
    @NSManaged public var phoneNumber: String?

}

extension Contact : Identifiable {

}
