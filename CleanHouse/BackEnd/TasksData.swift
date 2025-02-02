//
//  TasksData.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 21/01/25.
//


struct TasksData: Decodable {
    let livingRoom, bedroom, kitchen, bathroom, laundry: [String]
    
    func getRoom(room: Room) -> [String] {
        switch room {
            
        case .livingRoom: do { return livingRoom }
        case .bedroom: do { return bedroom }
        case .kitchen: do { return kitchen }
        case .bathroom: do { return bathroom }
        case .laundry: do { return laundry }
        }
    }
}
