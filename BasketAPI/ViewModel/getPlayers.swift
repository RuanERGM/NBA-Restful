//
//  getPlayers.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 29/11/23.
//

import Foundation


class GetPlayers:ObservableObject{
    
    @Published var page: Int = 0
    
    func getPlayers(completion: @escaping([PlayerEntry]) -> ()){
        
        guard let url = URL(string: "https://balldontlie.io/api/v1/players/?page=\(page)&per_page=100") else {
            
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


