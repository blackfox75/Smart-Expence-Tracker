//
//  UserInfo.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/6/20.
//

import Foundation

class User {
    var email : String?
    var jobs : [Job]?
    var debitCards : [DebitCard]?
    var mounthlySpent : [MounthlySpent]?
}

class Job {
    var name : String?
    var salary : String?
}

class DebitCard {
    var name : String?
    var money : Double?
}

class MounthlySpent {
    var nameOfSpend : String?
    var priceOfSpent : Double?
    var dateOfSpent : Date?
}
