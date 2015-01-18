//
//  Brain.swift
//  LemonadeStand
//
//  Created by David Nachtigall on 18.01.15.
//  Copyright (c) 2015 David Nachtigall. All rights reserved.
//

import Foundation

class LemonadeBrain {
    
    class func makePreferences(customers: Int) -> [String] {
        let preDefinedPreferences = ["acidic", "equal parts", "diluted"]
        var preferences:[String] = []
        for i in 1...customers {
           let preference = Int(arc4random_uniform(UInt32(3)))
            println("Random Number of preference: \(preference)")
            preferences.append(preDefinedPreferences[preference])
        }
    
    return preferences
    }
}