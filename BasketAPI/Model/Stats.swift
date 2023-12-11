//
//  Stats.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 06/12/23.
//

import Foundation

struct Stats: Codable{
    
    let games_played: Int
    let player_id: Int
    let season: Int
    let min: String
    let fgm: Int
    let fga: Int
    let fg3m: Int
    let fg3a: Int
    let ftm: Int
    let fta: Int
    let oreb: Int
    let dreb: Int
    let reb: Int
    let ast: Int
    let stl: Int
    let blk: Int
    let turnover: Int
    let pf: Int
    let pts: Int
    let fg_pct: Int
    let fg3_pct: Int
    let ft_pct: Int
    
}

struct AllStats: Codable{
    
    let data: [Stats]
    
}
