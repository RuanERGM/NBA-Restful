//
//  searchPlayers.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 11/12/23.
//

import Foundation

class SearchPlayers:ObservableObject{
    
    @Published var page: Int = 1
    
    func searchPlayers(search: String, completion: @escaping([PlayerEntry]) -> ()){
        
        guard let url = URL(string: "https://balldontlie.io/api/v1/players?search=\(search)&page=\(page)&per_page=100") else {
            
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response , error) in
            
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let players = try decoder.decode(Players.self, from: data)
                completion(players.data)
                
                // Agora você pode acessar a matriz de entradas de jogador em players.results
            } catch let error {
                print("Erro ao decodificar JSON: \(error)")
            }
        }.resume()
    }
}
