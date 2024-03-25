//
//  DescriptionViewHeader.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 24.03.2024.
//

import SwiftUI

struct DescriptionViewHeader: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            HStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.clear)
                Button("", image: .back) {
                    coordinator.fullScreenPresent(.search)
                }
                .padding(.leading, -250)
                Image(.eye)
                Image(.param)
                Button("", image: .favor) {  }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.black)
    }
}

#Preview {
    DescriptionViewHeader()
}
