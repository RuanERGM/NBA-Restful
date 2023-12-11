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
                    
                    ForEach(searchText == "" ? players: players.filter( {$0.first_name.contains(searchText)}) ) { player in
                        
                        
                        Text("\(player.first_name) \(player.last_name)")
                        
                        
                    }
                    
                    ProgressView()
                        .frame(alignment: .center)
                        .progressViewStyle(.circular)
                        .onAppear(){
                            vm.page += 1
                            if(searchText.isEmpty){
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
                        .onChange(of: searchText){
                            players.removeAll()
                            searchVM.searchPlayers(search: searchText){ playerArrary in for appendPlayer in playerArrary{
                                players.append(appendPlayer)
                            }
                                
                            }
                            
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
