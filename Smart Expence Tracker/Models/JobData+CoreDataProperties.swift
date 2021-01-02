//
//  JobData+CoreDataProperties.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 1/1/21.
//
//

import Foundation
import CoreData


extension JobData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JobData> {
        return NSFetchRequest<JobData>(entityName: "JobData")
    }

    @NSManaged public var salary: Double
    @NSManaged public var name: String?
    @NSManaged public var userOfJob: UserData?

}

extension JobData : Identifiable {

}
