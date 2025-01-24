//
//  CleanHouseApp.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 20/01/25.
//

import SwiftUI
import SwiftData

@main
struct CleanHouseApp: App {
    
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
        .modelContainer(for: DataModel.self)
    }
}
