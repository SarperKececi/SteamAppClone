import SwiftUI
import Kingfisher

struct FavoritesScreen: View {
    @State private var favoriteGames: [GameModel] = []

    var body: some View {
        VStack {
            ScrollView {
                ForEach(favoriteGames, id: \.title) { item in
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
                        Button(action: {
                        
                        }) {
                            Image(systemName: "cart")
                                .padding()
                        }
                        
                        
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(8)
                }
            }
            
            Button("Clear") {
                UserDefaults.standard.removeObject(forKey: "favoriteGames")
                favoriteGames = []
             
            }
            .padding()
           
           
        }
        .onAppear {
           
            favoriteGames = getFavoriteGames()
         
        }
    }
 
    func getFavoriteGames() -> [GameModel] {
        if let data = UserDefaults.standard.data(forKey: "favoriteGames") {
            let decoder = JSONDecoder()
            if let games = try? decoder.decode([GameModel].self, from: data) {
                return games
            }
        }
        return []
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}

