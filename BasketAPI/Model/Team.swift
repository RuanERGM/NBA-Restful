//
//  Team.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 29/11/23.
//

import Foundation

struct Team: Codable{
    
    let id = UUID()
    let abbreviation: String
    let city: String
    let conference: String
    let division: String
    let full_name: String
    let name: String
}
