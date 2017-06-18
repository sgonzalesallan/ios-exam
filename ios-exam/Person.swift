//
//  Person.swift
//  ios-exam
//
//  Created by Allan Gonzales on 6/19/17.
//  Copyright © 2017 upraxis. All rights reserved.
//

import UIKit
import EVReflection

class Person: EVObject  {

    var address: String = ""
    var birthday: String = ""
    var contact_person: String = ""
    var contact_person_number: String = ""
    var email: String = ""
    var first_name: String = ""
    var last_name: String = ""
    var mobile_number: String = ""
    
    var name: String {
        return first_name + " " + last_name
    }
    
    var age: Int {
        if self.birthday == "" {
            return 0
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let birthday = dateFormatter.date(from: self.birthday)
        let now = Date()
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: birthday!, to: now)
        return ageComponents.year!
        
    }
    
    static let key = "person_key_list"
    
    func setValue(value: AnyObject!, forUndefinedKey key: String) {
        switch key {
        case "address": self.address = value as! String
        case "birthday": self.birthday = value as! String
        case "contact_person": self.contact_person = value as! String
        case "contact_person_number": self.contact_person_number = value as! String
        case "email": self.email = value as! String
        case "first_name": self.first_name = value as! String
        case "last_name": self.last_name = value as! String
        case "mobile_number": self.mobile_number = value as! String
        default: break
        }
    }
    
    
}
