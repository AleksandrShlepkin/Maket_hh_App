//
//  ContainerView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 21.03.2024.
//

import SwiftUI

enum Pages: String, Identifiable {
    case login, verify, tab
    
    var id: String { self.rawValue }
}

enum FullScreenCover: String, Identifiable, CaseIterable {
    case fullSearch, search, description
    
    var id: String { self.rawValue }
}

@MainActor
final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var page: Pages = .login
    @Published var fullScreenCover: FullScreenCover?
    
    func pagePresent(_ page: Pages) {
        path.append(page)
    }
    
    func goToRoot() {
        path.removeLast(path.count)
    }

    func fullScreenPresent(_ screen: FullScreenCover) {
        self.fullScreenCover = screen
    }

    @ViewBuilder
    func getPage(_ page: Pages) -> some View {
        switch page {
        case .login:
            LoginView()
        case .verify:
            CodeView()
        case .tab:
            MainTabBar()
        }
    }
    
    @ViewBuilder
    func fullScreen(_ screen: FullScreenCover) -> some View {
        switch screen {

        case .fullSearch:
            FullSearchView()
        case .search:
            SearchView()
        case .description:
            DescriptionView()
        }
    }
}
