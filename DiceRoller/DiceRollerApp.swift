//
//  DiceRollerApp.swift
//  DiceRoller
//
//  Created by Brian Vo on 5/23/24.
//

import SwiftUI
import SwiftData

@main
struct DiceRollerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Dice.self)
    }
}
