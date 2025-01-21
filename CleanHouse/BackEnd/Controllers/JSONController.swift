//
//  JSONController.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 21/01/25.
//

import Foundation

func getTasks() -> TasksData? {
    if let url = Bundle.main.url(forResource: "tasks", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(TasksData.self, from: data)
            return jsonData
        } catch {
            print("Error: \(error)")
        }
    }
    return nil
}
