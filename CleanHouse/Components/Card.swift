//
//  Card.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 20/01/25.
//

import SwiftUI



struct Card: View {
    
    var room: Room
    @Binding var selectedRoom: Room
    
    init(_ room: Room, selectedRoom: Binding<Room>) {
        self.room = room
        self._selectedRoom = selectedRoom
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill((selectedRoom == room) ? .blue.opacity(0.3) : .blue.opacity(0.3))
            .stroke(Color.blue, lineWidth: 6)
            .frame(maxWidth: .infinity)
            .frame(height: 125)
            .overlay {
                HStack(spacing: 20) {
                    // Aqui colocamos qual o ícone e nome
                    // do cômodo em que aparece no card
                    
                    Image(systemName: room.roomIcon)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text(room.roomName)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .grayscale((selectedRoom == room) ? 0 : 1)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .scaleEffect((selectedRoom == room) ? 1 : 0.9)
    }
}

#Preview {
    Card(.livingRoom, selectedRoom: .constant(.bathroom))
//        .padding(.vertical)
    Card(.livingRoom, selectedRoom: .constant(.livingRoom))
//        .padding(.vertical)
}
