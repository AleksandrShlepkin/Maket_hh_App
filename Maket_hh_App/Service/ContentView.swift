//
//  ContentView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 18.03.2024.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel = SearhViewModel(networkService: APIService())
    @StateObject var vacancy = VacancyViewModel()
    @StateObject var emailText = LoginViewModel()
    @StateObject var field = OTPViewModel()


    
    var body: some View {
        CoordinatorView()
            .environmentObject(viewModel)
            .environmentObject(vacancy)
            .environmentObject(emailText)
            .environmentObject(field)
    }
}

#Preview {
    
    MainTabBar()
    
}
