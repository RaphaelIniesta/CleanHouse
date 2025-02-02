//
//  ContentView.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 20/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDefaultOn") var defaults: Bool = false
    
    @State var room: Room = .livingRoom
    @State var selectedRoom: Room = .livingRoom
    
    var body: some View {
        NavigationStack {
            NavigationSplitView {
                SideBarView(selectedRoom: $selectedRoom, isShowingDefault: $defaults)

            } detail: {
                TasksView(selectedRoom: $selectedRoom, isDefaultOn: $defaults)
            }
        }
    }
}

#Preview {
    ContentView()
}
