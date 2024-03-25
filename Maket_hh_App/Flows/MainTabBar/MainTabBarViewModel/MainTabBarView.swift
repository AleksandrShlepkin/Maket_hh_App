//
//  MainTabBarView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 25.03.2024.
//

import SwiftUI

public enum Images: String {
    case search = "Search"
    case favorite = "Favor"
    case response = "MailImage"
    case message = "message"
    case profile = "profile"
}

public enum Name: String {
    case search = "Поиск"
    case favorite = "Избранное"
    case response = "Отклики"
    case message = "Сообщения"
    case profile = "Профиль"
}

public enum Title: String {
    case search
    case favorite
    case response
    case message
    case profile
}

final class MainTabBarViewModel: ObservableObject {
    
    @ViewBuilder
    private func getLoginView(name: Name, image: Images) -> some View {
        LoginView()
            .tabItem {
                Image(image.rawValue)
                Text(name.rawValue)
                    .foregroundStyle(Color(.lightGray))
            }
    }
    
    
    @ViewBuilder
    func getView(_ array: [String], key: Title, name: Name, image: Images) -> some View {
        
        if array != ["1","2","3","4"] {
            
            getLoginView(name: name, image: image)
            
            
        } else {
            switch key {
            case .search:
                SearchView()
                    .tabItem {
                        Image("Search")
                        Text("Поиск")
                            .foregroundStyle(Color(.lightGray))
                    }
                
            case .favorite:
                FavoriteView()
                    .tabItem {
                        Image(.favor)
                        Text("Избранное")
                            .foregroundStyle(Color(.lightGray))
                    }
            case .message:
                FavoriteView()
                    .tabItem {
                        Image(.message)
                        Text("Сообщения")
                            .foregroundStyle(Color(.lightGray))
                    }
            case .profile:
                FavoriteView()
                    .tabItem {
                        Image(.profile)
                        Text("Профиль")
                            .foregroundStyle(Color(.lightGray))
                    }
            case .response:
                FavoriteView()
                    .tabItem {
                        Image(.mail)
                        Text("Отклики")
                            .foregroundStyle(Color(.lightGray))
                    }
            }
        }
        
    }
    
}
