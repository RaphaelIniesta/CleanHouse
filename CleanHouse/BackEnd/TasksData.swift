//
//  TasksData.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 21/01/25.
//


struct TasksData: Decodable {
    let livinRoom, bedroom, kitchen, bathroom: [String]
}