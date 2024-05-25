//
//  ContentView.swift
//  DiceRoller
//
//  Created by Brian Vo on 5/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var diceQuantity = 2
    @State private var diceSides = 6
    let size = [4,6,8,10,12,20,100]
    @State private var total = 0;
    @State private var previousView = false
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack{
            Form{
                Picker("How many dices?", selection:  $diceQuantity){
                    ForEach(1..<11) { number in
                        Text("\(number)")
                    }
                    
                }
                .pickerStyle(.automatic)
                
                Picker("What type of sided dice?", selection:  $diceSides){
                    ForEach(size, id: \.self) { side in
                        Text("\(side)")
                    }
                    
                }
                .pickerStyle(.automatic)
                
                HStack{
                    Text("Total:")
                    Spacer()
                    Text("\(total)")
                    
                }
                
                
            }
        
            .toolbar{
//                ToolbarItem(placement: .topBarLeading){
//                    Button("View previous Rolls"){
//                        previousView = true
//                    }
//                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                                       NavigationLink(destination: PreviousRollsView()) {
                                           Text("Previous Rolls")
                                       }
                                   }
                
               
                
                ToolbarItem{
                    Button("Roll"){
                        
                        roll()
                        save()
                        
                    }
                }
            }
            .sheet(isPresented: $previousView){
                PreviousRollsView()
            }
        }
        
        
    }
    
    
    func roll(){
        total = 0
        for _ in 0..<diceQuantity+1{
            total += Int.random(in: 1...diceSides)
        }
        
        
    }
    
    func save(){
        let dice = Dice(quantity: diceQuantity+1, sides: diceSides, total: total)
        modelContext.insert(dice)
        
    }
    
    
    
    
}

#Preview {
    ContentView()
}
