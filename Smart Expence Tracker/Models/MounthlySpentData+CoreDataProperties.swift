//
//  MounthlySpentData+CoreDataProperties.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 1/1/21.
//
//

import Foundation
import CoreData


extension MounthlySpentData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MounthlySpentData> {
        return NSFetchRequest<MounthlySpentData>(entityName: "MounthlySpentData")
    }

    @NSManaged public var mounthlySpentName: String?
    @NSManaged public var mounthlySpentSum: Int16
    @NSManaged public var mounthlySpentDate: Date?
    @NSManaged public var cardOfMounthlySpent: DebitCardData?

}

extension MounthlySpentData : Identifiable {

}
