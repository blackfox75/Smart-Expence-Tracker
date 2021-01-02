//
//  DebitCardData+CoreDataProperties.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 1/1/21.
//
//

import Foundation
import CoreData


extension DebitCardData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DebitCardData> {
        return NSFetchRequest<DebitCardData>(entityName: "DebitCardData")
    }

    @NSManaged public var debitCardName: String?
    @NSManaged public var debitCardAmountOfMoney: Double
    @NSManaged public var mounthlySpent: NSSet?
    @NSManaged public var userOfDebitCard: UserData?

}

// MARK: Generated accessors for mounthlySpent
extension DebitCardData {

    @objc(addMounthlySpentObject:)
    @NSManaged public func addToMounthlySpent(_ value: MounthlySpentData)

    @objc(removeMounthlySpentObject:)
    @NSManaged public func removeFromMounthlySpent(_ value: MounthlySpentData)

    @objc(addMounthlySpent:)
    @NSManaged public func addToMounthlySpent(_ values: NSSet)

    @objc(removeMounthlySpent:)
    @NSManaged public func removeFromMounthlySpent(_ values: NSSet)

}

extension DebitCardData : Identifiable {

}
