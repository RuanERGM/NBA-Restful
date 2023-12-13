//
//  DetailView.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 06/12/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var playerDetailVm = getPlayersDetails()
    @State var stats = [Stats]()
    @State var playerName: String
    @State var id: Int
    var body: some View {
        VStack{
           
            if(stats.isEmpty){
                
                Text("No data found for " + playerName)
                
            }
            else{
                ForEach(stats) { stat in
                    List{
                        Text("Média de minutos jogados: " + stat.min)
                        Text("Média de pontos: \(stat.pts)")
                        Text("Média de rebotes: \(stat.reb)")
                        Text("Média de assitência: \(stat.ast)")
                        Text("Média de turnovers: \(stat.turnover)")
                    }
                    
                    
                }
            }
                
        }
        
        .onAppear(){
            playerDetailVm.id = id
            playerDetailVm.getDetails(){ statsArray in
                for newStats in statsArray{
                    stats.append(newStats)
                }
                
            }
        }
        .navigationTitle(playerName)
    }
    
}

#Preview {
    DetailView(playerName: "", id: 0)
}
