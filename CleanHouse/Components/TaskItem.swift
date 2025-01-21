//
//  TaskItem.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 20/01/25.
//

import SwiftUI

struct TaskItem: View {
    
    @State var isDone: Bool = false
    @State var text: String
    
    var body: some View {
        HStack {

            Image(systemName: isDone ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundStyle(isDone ? .green : .black)
            
            Text(text)
                .animatedStrikeThrough(isDone)
                .font(.largeTitle)
                .opacity(isDone ? 0.7 : 1)
        }
        .onTapGesture {
            withAnimation(.smooth) {
                isDone.toggle()
            }
        }
    }
}

#Preview {
    TaskItem(text: "Essa é uma tarefa muito importante")
    
    TaskItem(text: "Essa é uma tarefa muito importante \ncom duas linhas")
}
