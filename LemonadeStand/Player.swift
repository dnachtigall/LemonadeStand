//
//  Player.swift
//  LemonadeStand
//
//  Created by David Nachtigall on 18.01.15.
//  Copyright (c) 2015 David Nachtigall. All rights reserved.
//

import Foundation

struct Player {
    
    var balance = 0
    var iceCubes = 0
    var lemons = 0
    init (aBalance: Int, aIceCubes: Int, aLemons : Int) {
        balance = aBalance
        iceCubes = aIceCubes
        lemons = aLemons
    }
    
}