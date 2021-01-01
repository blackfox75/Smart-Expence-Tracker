//
//  UserData+CoreDataProperties.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/27/20.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var name: String?
    @NSManaged public var debitCard: DebitCardData?
    @NSManaged public var job: JobData?
    @NSManaged public var mounthlySpent: MounthlySpentData?

}

extension UserData : Identifiable {

}
