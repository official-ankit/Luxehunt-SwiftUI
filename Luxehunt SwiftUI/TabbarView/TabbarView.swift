//
//  TabbarView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab = 0   

    var body: some View {
        TabView(selection: $selectedTab) {

            HomeView()
                .tabItem {
                    Image("ic-tab-home")
                    Text("Home")
                }
                .tag(0)

            SalesView()
                .tabItem {
                    Image("ic-tab-price")
                    Text("Price")
                }
                .tag(1)

            ProfileView()
                .tabItem {
                    Image("profile")
                    Text("Profile")
                }
                .tag(2)
        }
    }
}

#Preview {
    TabbarView()
}
