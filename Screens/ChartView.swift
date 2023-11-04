//
//  ChartView.swift
//  SteamAppClone
//
//  Created by Sarper Kececi on 27.10.2023.
//

import SwiftUI
import Kingfisher

struct ChartView: View {
    @State private var cartedGames : [GameModel] = []
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(cartedGames, id: \.title) { item in
                    HStack {
                        KFImage(URL(string: item.thumb))
                            .resizable()
                            .frame(width: 70, height: 70)
                            .cornerRadius(8)
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                                .foregroundColor(.blue)
                            Text("Normal Price: \(item.normalPrice)")
                            Text("Sale Price: \(item.salePrice)")
                            Text("Steam Rating: \(item.steamRatingPercent)%")
                        }
                       
                        Spacer()
                       
                       
                        
                        
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(8)
                }
            }
        }
        .onAppear {
            cartedGames = getFavoriteGames()
        }
    }
    
    func getFavoriteGames() -> [GameModel] {
        if let data = UserDefaults.standard.data(forKey: "cartGames") {
            let decoder = JSONDecoder()
            if let games = try? decoder.decode([GameModel].self, from: data) {
                return games
            }
        }
        return []
    }
    
    
    
}
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
