//
//  ContentView.swift
//  SteamAppClone
//
//  Created by Sarper Kececi on 26.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoginSuccessful : Bool = UserDefaults.standard.bool(forKey: "isLogin")
    var body: some View {
        NavigationView {
            VStack {
                if(isLoginSuccessful) {
                    Tab()
                } else {
                    LoginScreen()
                }
            }
        }
       
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
