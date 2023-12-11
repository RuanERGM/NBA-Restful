//
//  Player.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 29/11/23.
//

import Foundation

struct PlayerEntry: Codable,Identifiable {
    
//    let id: Int
    let id = UUID()
    let first_name: String
    let last_name: String
    let height_feet: Int?
    let height_inches: Int?
    let position: String
    var team: Team
    var weight_pounds: Int?

}

struct Players: Codable {
    var data: [PlayerEntry]
}


