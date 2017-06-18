//
//  Service.swift
//  ios-exam
//
//  Created by Allan Gonzales on 6/19/17.
//  Copyright © 2017 upraxis. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

typealias ResultBlock = (Any?, Error?) -> Void


class Service: NSObject {
    
    static let reference = FIRDatabase.database().reference()

    static func getPersonList(block: @escaping ResultBlock) {
        
        if let result = Defaults.getObject(key: Person.key) as? [Person] {
            block(result, nil)
            return
        }
        
        reference.child("person").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                if let array = snapshot.value as? NSArray {
                    let result = [Person](json: array.toJSONString())
                    Defaults.saveObject(object: result, key: Person.key)
                    block(result, nil)
                }
            } else {
                block(nil, nil)
            }
        })
    }
}


