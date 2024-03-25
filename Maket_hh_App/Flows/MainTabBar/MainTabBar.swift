//
//  MainTabBar.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 18.03.2024.
//

import SwiftUI

struct MainTabBar: View {
    
    @StateObject var viewModel = MainTabBarViewModel()

    @EnvironmentObject var field: OTPViewModel
    
    var body: some View {
        TabView {
            
            getView(field.fields, key: .search, name: .search, image: .search)
            getView(field.fields, key: .favorite, name: .favorite, image: .favorite)
            getView(field.fields, key: .response, name: .response, image: .response)
            getView(field.fields, key: .message, name: .message, image: .message)
            getView(field.fields, key: .profile, name: .profile, image: .profile)

        }
        .toolbarBackground(Color.black, for: .tabBar)
    }
    
    @ViewBuilder
    private func getView(_ array: [String], key: Title, name: Name, image: Images) -> some View {
        
        viewModel.getView(array, key: key, name: name, image: image)
    }
}


#Preview {
    MainTabBar()
}
