//
//  SearchView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 20.03.2024.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ScrollView {
            VStack {
                SearchViewHeader()
                SearchViewMiddle()
                    .padding(.leading)
                Text("Вакансии для вас")
                    .font(.title2)
                    .foregroundStyle(Color.white)
                SearchViewFooter(mark: false)
            }
            .background(Color.black)
        }
        .scrollIndicators(.hidden)
        .background(Color.black)
        .tableColumnHeaders(.visible)    
    }
}

#Preview {
    SearchView()
}
