//
//  setGrid.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 23/01/25.
//

import Foundation
import SwiftData

func setGrid(model: [DataModel], selectedRoom: Room, isDefaultOn: Bool) -> [[String]] {
    var arr: [String] = []
    var grid: [[String]] = []
    
    if(isDefaultOn) {
        let defaults = getTasks()
        
        for item in defaults.getRoom(room: selectedRoom) {
            if(arr.count == 2) {
                grid.append(arr)
                arr.removeAll()
            }
            arr.append(item)
        }
        
        if(!arr.isEmpty) {
            grid.append(arr)
            arr.removeAll()
        }
    }
    
    for item in model {
        if(item.room == selectedRoom && arr.count < 2) {
            arr.append(item.task)
        } else {
            grid.append(arr)
            arr.removeAll()
        }
    }
    
    if(!arr.isEmpty) {
        grid.append(arr)
    }
    
    return grid
}
