//
//  Tab.swift
//  SteamAppClone
//
//  Created by Sarper Kececi on 27.10.2023.
//

import SwiftUI

struct Tab: View {
    var body: some View {
        TabView {
            GamesScreen()
                .tabItem {
                   
                    Label("Home" , systemImage: "homekit")
                }
            
            FavoritesScreen()
                .tabItem {
                    Label("Favorites" , systemImage: "star.fill")
                }
            
            ChartView()
                .tabItem {
                    Label("Cart" , systemImage: "cart.circle")
                }
            
            ProfileScreen()
                .tabItem {
                    Label("Profil" , systemImage: "person")
                }
            
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
