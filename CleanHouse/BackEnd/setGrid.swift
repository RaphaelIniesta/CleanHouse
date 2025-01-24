//
//  setGrid.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 23/01/25.
//

import Foundation
import SwiftData

func setGrid(model: [DataModel], selectedRoom: Room) -> [[String]] {
    var arr: [String] = []
    var grid: [[String]] = []
    
    for item in model {
        if(item.room == selectedRoom && arr.count < 3) {
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
