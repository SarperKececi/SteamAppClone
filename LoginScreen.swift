import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoginSuccessful: Bool = false

    var body: some View {
        ZStack {
            Color.pink.opacity(0.2) // Arka plan rengi
                .ignoresSafeArea()
            VStack {
                NavigationLink(destination: Tab(), isActive: $isLoginSuccessful) { EmptyView() }

                Text("Hoş Geldiniz")
                    .font(.largeTitle)
                    .foregroundColor(.blue) // Başlık rengi

                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.blue) // Kullanıcı ikonunun rengi
                    .padding()

                TextField("E-posta", text: $email)
                    .padding()
                    .background(Color(.systemGray6)) // Metin alanı arka plan rengi
                    .cornerRadius(8) // Metin alanı köşe yuvarlama
                    .padding(.horizontal)
                    .autocapitalization(.none) // Büyük harf otomatik düzeltmeyi kapatır

                SecureField("Şifre", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                Button(action: {
                    if email == "test@test.com" && password == "123" {
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        isLoginSuccessful = true
                    }
                }) {
                    Text("Giriş Yap")
                        .font(.title)
                        .frame(width: 110, height: 30) // Düğme boyutunu ayarla
                        .padding()
                        .background(Color.blue) // Düğme rengi
                        .foregroundColor(.white) // Düğme metin rengi
                        .cornerRadius(8)
                }
                .padding()

                Spacer() // Diğer bileşenlerden boşluk bırakır
            }
            .padding()
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

