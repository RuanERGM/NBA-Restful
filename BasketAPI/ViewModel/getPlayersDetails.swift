//
//  getPlayersDetails.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 06/12/23.
//

import Foundation

class getPlayersDetails: ObservableObject{
    
    @Published var id:Int = 0
    
    func getDetails( completion: @escaping([Stats]) -> ()){
        
        guard let url = URL(string: "https://balldontlie.io/api/v1/season_averages?player_ids[]=\(id)") else {
            
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response , error) in
            
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let allStats = try decoder.decode(AllStats.self, from: data)
                completion(allStats.data)
                
                
            } catch let error {
                print("Erro ao decodificar JSON: \(error)")
            }
        }.resume()
    }
    
}
