//
//  MainView.swift
//  BasketAPI
//
//  Created by Ruan Eleutério  on 03/12/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            
            GamesView()
                .tabItem {
                    
                    Label("games", systemImage: "person.fill")
                }
            
            PlayersView()
                .tabItem {
                    
                    Label("Players", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
