//
//  TasksView.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 23/01/25.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    @Environment(\.modelContext) var context
    @Query var tasks: [DataModel]
    
    @Binding var selectedRoom: Room
    @Binding var isDefaultOn: Bool
    @State var grid: [[String]] = []
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 50) {
            ForEach(grid, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        TaskItem(text: item)
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .onAppear {
            grid = setGrid(model: tasks, selectedRoom: selectedRoom, isDefaultOn: isDefaultOn)
        }
        .onChange(of: selectedRoom) {
            grid = setGrid(model: tasks, selectedRoom: selectedRoom, isDefaultOn: isDefaultOn)
        }
        .onChange(of: isDefaultOn) {
            grid = setGrid(model: tasks, selectedRoom: selectedRoom, isDefaultOn: isDefaultOn)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            SheetView(grid: $grid, selectedRoom: $selectedRoom, isDefaultOn: $isDefaultOn)
        }
    }
}

#Preview {
    TasksView(selectedRoom: .constant(.bedroom), isDefaultOn: .constant(false))
}
