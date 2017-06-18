//
//  Default.swift
//  ios-exam
//
//  Created by Allan Gonzales on 6/19/17.
//  Copyright © 2017 upraxis. All rights reserved.
//

import UIKit

class Defaults: NSObject {
    
    static func saveObject(object: Any, key: String) {
        let defaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: object)
        defaults.set(encodedData, forKey: key)
        defaults.synchronize()
    }
    
    static func getObject(key: String) -> Any? {
        let defaults = UserDefaults.standard
        guard let decoded = defaults.object(forKey: key) as? Data else {
            return nil
        }
        
        guard let unarchived = NSKeyedUnarchiver.unarchiveObject(with: decoded) else {
            return nil
        }
        
        return unarchived
    }
    
    
    static func remove(key: String) {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
}
