import SwiftUI
import Alamofire
import Kingfisher

struct GamesScreen: View {
    @State private var games: [GameModel] = []
    @State private var selectedCartGames: [GameModel] = []
    @State private var favoriteGames: [GameModel] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Steam Games")
                    .font(.title)
                    .bold()
                    .padding()
                ForEach(games, id: \.title) { item in
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
                            if !selectedCartGames.contains(where: { $0.title == item.title }) {
                                selectedCartGames.append(item)
                                cartGames()
                            } else {
                                if let indexNo = selectedCartGames.firstIndex(where: { $0.title == item.title }) {
                                    selectedCartGames.remove(at: indexNo)
                                    cartGames()
                                    NotificationCenter.default.post(name: Notification.Name("CartGameRemoved"), object: item)
                                }
                                    
                               
                            }
                        }) {
                            Image(systemName: selectedCartGames.contains(where: { $0.title == item.title }) ? "cart.fill" : "cart")
                                .padding()
                        }
                        
                        Button(action: {
                            if !favoriteGames.contains(where: { $0.title == item.title }) {
                                // Eğer favoriteGames dizisi içinde item.title ile aynı başlığa sahip bir öğe yoksa, bu blok çalışır.
                                favoriteGames.append(item)
                                saveFavoriteGames()
                            } else {
                                // Eğer favoriteGames dizisi içinde item.title ile aynı başlığa sahip bir öğe bulunursa, bu blok çalışır.
                                if let indexNo = favoriteGames.firstIndex(where: { $0.title == item.title }) {
                                    // `firstIndex(where:)` fonksiyonu, item.title ile aynı başlığa sahip öğenin dizindeki indisini döndürür.
                                    favoriteGames.remove(at: indexNo)
                                    saveFavoriteGames() // Favori kaldırıldığında kaydet
                                    NotificationCenter.default.post(name: Notification.Name("FavoriteGameRemoved"), object: item)
                                }
                            }
                        })
{
                            Image(systemName: favoriteGames.contains(where: { $0.title == item.title }) ? "star.fill" : "star")
                                .padding()
                        }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(8)
                }
            }
            .onAppear {
                fetchGames()
            
            }
        }
    }
    
   
    
    func fetchGames() {
        let request = AF.request("https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15")
        
        request.responseDecodable(of: [GameModel].self) { response in
            switch response.result {
            case .success(let games):
                self.games = games
            case .failure(let error):
                print("Hata: \(error)")
            }
        }
    }
    
    func saveFavoriteGames() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favoriteGames) {
            UserDefaults.standard.set(encoded, forKey: "favoriteGames")
        }
    }
    
    func cartGames () {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(selectedCartGames) {
            UserDefaults.standard.set(encoded, forKey: "cartGames")
        }
    }
}

struct GamesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GamesScreen()
    }
}
