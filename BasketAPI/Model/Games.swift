//
//  File.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 03/12/23.
//

import Foundation

struct Game: Identifiable,Codable{
    
    
    let id = UUID()
    let date: String
    var home_team: Team
    var home_team_score: Int
    let period: Int
    let postseason: Bool
    var season: Int
    var status: String
    var time: String?
    var visitor_team: Team
    var visitor_team_score: Int
}

struct Games: Codable{
    
    var data: [Game]
}
