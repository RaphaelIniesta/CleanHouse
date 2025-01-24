//
//  ContentView.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 20/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var room: Room = .livingRoom
    @State var selectedRoom: Room = .livingRoom
    
    var body: some View {
        NavigationStack {
            NavigationSplitView {
                ForEach(Room.allCases, id: \.self) { room in
                    Card(room, selectedRoom: $selectedRoom)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedRoom = room
                            }
                        }
                }
                .navigationSplitViewColumnWidth(375)
            } detail: {
                TasksView(selectedRoom: $selectedRoom)
            }
        }
    }
}

#Preview {
    ContentView()
}
