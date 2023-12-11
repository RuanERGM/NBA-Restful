//
//  getGames.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 03/12/23.
//

import Foundation

class GetGames :ObservableObject{
    
    @Published var page: Int = 0
  
    
    func getGames(season: Int, completion: @escaping([Game]) -> ()){
        
        guard let url = URL(string: "https://balldontlie.io/api/v1/games?seasons[]=\(season)&page=\(page)") else {
            
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response , error) in
            
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let games = try decoder.decode(Games.self, from: data)
                completion(games.data)
                
                // Agora você pode acessar a matriz de entradas de jogador em players.results
            } catch let error {
                print("Erro ao decodificar JSON: \(error)")
            }
        }.resume()
    }
}
