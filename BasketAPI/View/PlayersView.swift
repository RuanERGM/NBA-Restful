//
//  ContentView.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 27/11/23.
//

import SwiftUI

struct PlayersView: View {
    
    @ObservedObject var vm = GetPlayers()
    @ObservedObject var searchVM = SearchPlayers()
    @State var players = [PlayerEntry]()
    @State var searchText = ""
    var body: some View {
        
        
        NavigationView{
            
            ZStack{
                
                List{
                    
                    ForEach(players) { player in
                        
                        
                        NavigationLink("\(player.first_name) \(player.last_name)", destination: DetailView(playerName: "\(player.first_name) \(player.last_name)", id: player.id))
                        
                        
                        
                    }
                    
                    if(players.count >= 100 || players.count == 0){
                        ProgressView()
                            .frame(alignment: .center)
                            .progressViewStyle(.circular)
                            .onAppear(){
                                
                                
                                if(searchText.isEmpty){
                                    vm.page += 1
                                    
                                    vm.getPlayers(){ playerArray in
                                        for appendPlayer in playerArray{
                                            players.append(appendPlayer)
                                        }
                                    }
                                }
                                
                                else{
                                    searchVM.page += 1
                                    
                                    searchVM.searchPlayers(search: searchText){ playerArrary in for appendPlayer in playerArrary{
                                        players.append(appendPlayer)
                                    }
                                        
                                    }
                                }

                                
                            }

                    }
     
                }
                
            }
        }
        .onChange(of: searchText){
            
            if searchText.isEmpty{
                vm.page = 1
                players.removeAll()
                
                vm.getPlayers(){ playerArray in
                    for appendPlayer in playerArray{
                        players.append(appendPlayer)
                    }
                }                            }
            else{
                searchVM.page = 1
                players.removeAll()
                searchVM.searchPlayers(search: searchText){ playerArrary in for appendPlayer in playerArrary{
                    players.append(appendPlayer)
                }
                    
                }
            }
            
        }
        .searchable(text: $searchText)
    }
    
}

#Preview {
    PlayersView()
}
