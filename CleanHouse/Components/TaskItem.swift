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
                .strikethrough(isDone)
                .font(.largeTitle)
                .overlay {
                    HStack {
                        // Isso é um strike through com animação customizada
                        Rectangle()
                            .frame(maxWidth: isDone ? .infinity : 0)
                            .frame(maxHeight: 2, alignment: .bottom)
                            .padding(.top, 7)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
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
}
