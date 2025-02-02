//
//  SheetView.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 23/01/25.
//

import SwiftUI
import SwiftData

struct SheetView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @Query var tasks: [DataModel]
    
    @State var task: String = ""
    @State var room: Room = .livingRoom
    
    @Binding var grid: [[String]]
    @Binding var selectedRoom: Room
    @Binding var isDefaultOn: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Adicionar Nova Tarefa")
                    .font(.title)
                    .padding(.bottom, 30)
                
                Text("Qual a tarefa?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("", text: $task)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Em qual cômodo?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Selecione o Cômodo", selection: $room) {
                        ForEach(Room.allCases, id: \.self) { item in
                            Text(item.roomName).tag(item)
                        }
                    }.pickerStyle(.automatic)
                }
            }
            .padding(.horizontal, 20)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Adicionar") {
                        vm.addTask(task: task, room: room, context: context)
                        grid = setGrid(model: tasks, selectedRoom: selectedRoom, isDefaultOn: isDefaultOn)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    SheetView(grid: .constant([]), selectedRoom: .constant(.livingRoom), isDefaultOn: .constant(false))
}
