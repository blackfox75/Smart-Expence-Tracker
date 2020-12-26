//
//  User+CoreDataProperties.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/25/20.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?

}

extension UserData : Identifiable {

}
