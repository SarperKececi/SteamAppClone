//
//  ProfileScreen.swift
//  SteamAppClone
//
//  Created by Sarper Kececi on 27.10.2023.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var loginControl : Bool =  false 
    var body: some View {
        VStack {
            NavigationLink(destination: LoginScreen(), isActive: $loginControl) { EmptyView() }
            Button("Log Out") {
                UserDefaults.standard.set(false, forKey: "isLogin")
                loginControl = true
                
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
