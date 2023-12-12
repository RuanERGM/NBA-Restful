//
//  DetailView.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 06/12/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var vm =  getPlayersDetails()
    @State var stats: Stats?
    @State var playerName: String
    @State var id: Int
    var body: some View {
        VStack{
           
                
//            Text("Points: \(stats!.pts)")
//            Text("rebotes: \(stats!.reb)")
                Text("id: \(id)")
                
                
            
                
        }
        
        .onAppear(){
    
            vm.getDetails(id: id){ statsArray in 
                for newStats in statsArray{
                    stats = newStats
                }
                
            }
        }
        .navigationTitle(playerName)
    }
    
}

#Preview {
    DetailView(playerName: "", id: 0)
}
