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
                .border(.green)
            }
            
//            Button("Test") {
//                for item in tasks {
//                    print(item.task)
//                }
//            }
        }
        .padding()
//        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            grid = setGrid(model: tasks, selectedRoom: selectedRoom)
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
            SheetView(grid: $grid, selectedRoom: $selectedRoom)
        }
    }
}

#Preview {
    TasksView(selectedRoom: .constant(.bedroom))
}
