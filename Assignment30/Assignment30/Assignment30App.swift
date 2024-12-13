//
//  Assignment30App.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 11.12.24.
//

import SwiftUI

@main
struct Assignment30App: App {
    
    var body: some Scene {
        WindowGroup {
         
                MainView(viewModel: TimerViewModel(timers: [], timer: myTimer(duration: "", name: "", id: UUID(), remainingTime: 0, initialTime: 0)))

        }
    }
}
