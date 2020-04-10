//
//  ReservationCollection.swift
//  CapstonePrototypeCustomer
//
//  Created by Dhruvil Patel on 2020-04-10.
//  Copyright © 2020 Dhruvil Patel. All rights reserved.
//

import UIKit

class ReservationCollection: NSObject {
    
    var id: String?
    var name: String?
    var phoneNumber: String?
    var numberOfPeople: Int?
    var dateAndTime: Date?
    
    init(id:String?, name:String?, phoneNumber:String?, numberOfPeople:Int?, dateAndTime:Date?) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.numberOfPeople = numberOfPeople
        self.dateAndTime = dateAndTime
    }

}
