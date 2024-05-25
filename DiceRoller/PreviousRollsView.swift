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
    
     
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(rolls){ roll in
                    
                    VStack{
                        Text("Sides \(roll.sides)")
                        Text("Dices \(roll.quantity)")
                        Text("Total \(roll.total)")
                    }
                    
                    
                }
                .onDelete(perform: deleteRoll)
                
                
                
            }
            
            
            
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
