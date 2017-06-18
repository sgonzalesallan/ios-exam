//
//  Extension.swift
//  ios-exam
//
//  Created by Allan Gonzales on 6/19/17.
//  Copyright © 2017 upraxis. All rights reserved.
//

import UIKit

enum AppStoryboard : String {
    
    case Main
    
    var instance : UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

public extension NSDictionary {
    func toJSONString() -> String{
        let data = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        return String(data: data, encoding: String.Encoding.utf8)!
    }
}

public extension NSArray {
    func toJSONString() -> String{
        let data = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        return String(data: data, encoding: String.Encoding.utf8)!
    }
}
