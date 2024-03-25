//
//  CoordinatorView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 22.03.2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            
            coordinator.fullScreen(.tab)
                .fullScreenCover(item: $coordinator.fullScreenCover) { screen in
                    coordinator.fullScreen(screen)
                }
                .navigationDestination(for: Pages.self) { page in
                    coordinator.getPage(page)
                        .navigationBarBackButtonHidden(true)
                }

        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
