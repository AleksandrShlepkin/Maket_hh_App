//
//  MainTabBar.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 18.03.2024.
//

import SwiftUI

struct MainTabBar: View {
    
    @State var emailText: String?
    
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Image("Search")
                    Text("Search")
                        .foregroundStyle(Color(.gray))
                }
            SearchView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Search")
                        .foregroundStyle(Color(.gray))
                }
            SearchView()
                .tabItem {
                    Image("Search")
                    Text("Search")
                        .foregroundStyle(Color(.gray))
                }
            SearchView()
                .tabItem {
                    Image("Search")
                    Text("Search")
                        .foregroundStyle(Color(.gray))
                }
            SearchView()
                .tabItem {
                    Image("Search")
                    Text("Search")
                        .foregroundStyle(Color(.gray))
                }
        }
        .toolbar(.visible, for: .tabBar)
        .toolbarBackground(Color.black, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
        
    }
}

#Preview {
    MainTabBar(emailText: "")
}
