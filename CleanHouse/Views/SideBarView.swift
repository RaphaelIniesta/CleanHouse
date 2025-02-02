//
//  SideBarView.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 26/01/25.
//

import SwiftUI

struct SideBarView: View {
    
    @Binding var selectedRoom: Room
    @Binding var isShowingDefault: Bool
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(Room.allCases, id: \.self) { room in
                    Card(room, selectedRoom: $selectedRoom)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedRoom = room
                            }
                        }
                }
            }
            Toggle("Tarefas Padrão", isOn: $isShowingDefault)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        .navigationSplitViewColumnWidth(375)
    }
}

#Preview {
    SideBarView(selectedRoom: .constant(.bathroom), isShowingDefault: .constant(false))
}
