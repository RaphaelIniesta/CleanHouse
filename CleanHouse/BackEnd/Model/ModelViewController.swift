//
//  ModelViewController.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 23/01/25.
//

import Foundation
import SwiftData

class ViewModel: ObservableObject {
    
    func addTask(task: String, room: Room, context: ModelContext) {
        let task = DataModel(task: task, room: room)
        
        context.insert(task)
        
        print("Task Adicionada: \(task.task) | \(task.room.roomName)")
    }
    
    func editTask(task: DataModel, item: String, room: Room, context: ModelContext) {
        task.task = item
        
        do {
            try context.save()
        } catch {
            print("error: \(error)")
        }
    }
    
    func deleteTask(task: DataModel, context: ModelContext) {
        context.delete(task)
    }
    
}
