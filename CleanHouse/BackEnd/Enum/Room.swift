//
//  Room.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 20/01/25.
//


enum Room: String, Codable, CaseIterable {
    case livingRoom
    case bedroom
    case kitchen
    case bathroom
    case laundry
    
    var roomIcon: String {
        switch self {
        case .livingRoom: do { return "sofa"}
        case .bathroom: do { return "bathtub"}
        case .bedroom: do { return "bed.double"}
        case .kitchen:  do { return "fork.knife"}
        case .laundry: do { return "washer" }
        }
    }
    
    var roomName: String {
        switch self {
        case .livingRoom: do { return "Sala de Estar" }
        case .bedroom: do { return "Quarto" }
        case .kitchen: do { return "Cozinha" }
        case .bathroom: do { return "Banheiro" }
        case .laundry: do { return "Lavanderia" }
        }
    }
}
