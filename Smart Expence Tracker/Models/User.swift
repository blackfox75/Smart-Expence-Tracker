//
//  User.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/6/20.
//

import Foundation

class User : Codable, CustomDebugStringConvertible {
    var debugDescription: String {
        return "name - \(name)\nemail - \(email)"
        }
    var name : String = ""
    var email : String = ""
    var job : [Job] = []
    var debitCard : [DebitCard] = []
    var mounthlySpent : [MounthlySpent] = []
}

class Job : Codable{
    var name : String = ""
    var salary : Int = 0
    
    init() {
    }
    
    init(name : String, salary : Int) {
        self.name = name
        self.salary = salary
    }
}

class DebitCard : Codable {
    var debitCardName : String = ""
    var debitCardAmountOfMoney : Double = 0
    
    init() {
    }
    
    init(debitCardName : String, debitCardAmountOfMoney : Double) {
        self.debitCardName = debitCardName
        self.debitCardAmountOfMoney = debitCardAmountOfMoney
    }
}

class MounthlySpent : Codable {
    var mounthlySpentName : String = ""
    var mounthlySpentSum : Int = 0
    var mounthlySpentDate : Date = Date()
    
    init() {
    }
    
    init(mounthlySpentName : String, mounthlySpentSum : Int, mounthlySpentDate : Date) {
        self.mounthlySpentName = mounthlySpentName
        self.mounthlySpentSum = mounthlySpentSum
        self.mounthlySpentDate = mounthlySpentDate
    }
}
