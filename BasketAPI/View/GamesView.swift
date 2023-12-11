//
//  GamesView.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 03/12/23.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var vm = GetGames()
    @State private var selectedYear = Calendar.current.component(.year, from: Date())

    let years = Array(1946...Calendar.current.component(.year, from: Date()))

    
    @State var games = [Game]()
    let colums = [
       
        GridItem(.flexible())
    ]
    var body: some View {
        
        NavigationView{
            
            
            ScrollView{
                
                LazyVGrid(columns: colums, spacing: 20){
                    
                    ForEach(games){ game in
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.back)
                            .overlay{
                                
                                VStack(alignment: .leading){
                                    Text("\(game.date)")
                                        .padding(.bottom,40)
                                    HStack{
                                        VStack{
                                            Image(game.home_team.full_name)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80,height: 80)
                                            
                                            
                                            
                                            Text("\(game.home_team_score)")
                                                .padding()
                                        }
                                        .frame(width: 100,height: 80)
                                        
                                        
                                        Text("X")
                                            .padding(.horizontal,30)
                                        
                                        VStack{
                                            Image(game.visitor_team.full_name)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80,height: 80)
                                            
                                            
                                            
                                            Text("\(game.visitor_team_score)")
                                                .padding()
                                        }
                                        .frame(width: 100,height: 80)
                                        
                                    }
                                }
                                .padding()
                                

                            }
                            .frame(width: 350,height: 200,alignment: .topLeading)
                            .padding()

                    }
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame()
                        .onAppear(){
                            vm.page += 1
                            vm.getGames(season: selectedYear){ gamesArray in
                                for game in gamesArray{
                                    games.append(game)
                                }
                            }
                        }
                }
                
              
            }
            .navigationTitle("Season: \(String(selectedYear))")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .automatic){
                    Picker("Select a year", selection: $selectedYear) {
                                  ForEach(years, id: \.self) { year in
                                      Text(year.description)
                                  }
                              }
                }
            }
            .fontWeight(.medium)
            
            .onChange(of: selectedYear){
                games.removeAll()
                vm.page = 0
                vm.getGames(season: selectedYear){ gamesArray in
                    for game in gamesArray{
                        games.append(game)
                    }
                }
            }
            
        }
        
        
        
        
        
    }
}

#Preview {
    GamesView()
}
