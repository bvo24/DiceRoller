//
//  Dice.swift
//  DiceRoller
//
//  Created by Brian Vo on 5/23/24.
//

import Foundation
import SwiftData

@Model 
class Dice{
    
    var quantity : Int
    var sides : Int
    var total : Int

    init(quantity: Int, sides: Int, total: Int) {
        self.quantity = quantity
        self.sides = sides
        self.total = total
    }
    
//    static let example = Dice(quantity: 2, sides: 6)
    
    
}
