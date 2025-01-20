//
//  Room.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 20/01/25.
//


enum Room: String, CaseIterable {
    case livingRoom
    case bedroom
    case kitchen
    case bathroom
    
    var roomIcon: String {
        switch self {
        case .livingRoom: do { return "sofa"}
        case .bathroom: do { return "bathtub"}
        case .bedroom: do { return "bed.double"}
        case .kitchen:  do { return "fork.knife"}
        }
    }
    
    var roomName: String {
        switch self {
        case .livingRoom: do { return "Sala de Estar" }
        case .bedroom: do { return "Quarto" }
        case .kitchen: do { return "Cozinha" }
        case .bathroom: do { return "Banheiro" }
        }
    }
}
