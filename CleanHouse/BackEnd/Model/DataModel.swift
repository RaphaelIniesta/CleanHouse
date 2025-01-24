//
//  DataModel.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 23/01/25.
//

import Foundation
import SwiftData

@Model
final public class DataModel {
    
    var task: String
    var room: Room
    
    init(task: String, room: Room) {
        self.task = task
        self.room = room
    }
    
}
