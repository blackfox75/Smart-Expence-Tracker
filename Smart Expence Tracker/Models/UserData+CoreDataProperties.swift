//
//  UserData+CoreDataProperties.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 1/1/21.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var name: String?
    @NSManaged public var debitCard: NSSet?
    @NSManaged public var job: NSSet?

}

// MARK: Generated accessors for debitCard
extension UserData {

    @objc(addDebitCardObject:)
    @NSManaged public func addToDebitCard(_ value: DebitCardData)

    @objc(removeDebitCardObject:)
    @NSManaged public func removeFromDebitCard(_ value: DebitCardData)

    @objc(addDebitCard:)
    @NSManaged public func addToDebitCard(_ values: NSSet)

    @objc(removeDebitCard:)
    @NSManaged public func removeFromDebitCard(_ values: NSSet)

}

// MARK: Generated accessors for job
extension UserData {

    @objc(addJobObject:)
    @NSManaged public func addToJob(_ value: JobData)

    @objc(removeJobObject:)
    @NSManaged public func removeFromJob(_ value: JobData)

    @objc(addJob:)
    @NSManaged public func addToJob(_ values: NSSet)

    @objc(removeJob:)
    @NSManaged public func removeFromJob(_ values: NSSet)

}

extension UserData : Identifiable {

}
