//
//  PreviousRollsView.swift
//  DiceRoller
//
//  Created by Brian Vo on 5/23/24.
//

import SwiftUI
import SwiftData

struct PreviousRollsView: View {
    
    @Query var rolls : [Dice]
    @Environment(\.modelContext) var modelContext
    
    var sortedRolls: [Dice] {
            rolls.sorted(by: { $0.madeAt > $1.madeAt })
        }
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(sortedRolls){ roll in
                    
                    VStack{
                        Text("Sides \(roll.sides)")
                        Text("Dices \(roll.quantity)")
                        Text("Total \(roll.total)")
                    }
                    
                    
                }
                .onDelete(perform: deleteRoll)
                
                
                
            }
            .navigationTitle("Latest rolls")
            
        
            
            
            
        }
    }
    
    
    func deleteRoll(_ indexSet : IndexSet){
        
        
        for index in indexSet{
            let roll = rolls[index]
            modelContext.delete(roll)
        }
        
    }
}

#Preview {
    PreviousRollsView()
}
