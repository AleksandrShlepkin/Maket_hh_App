//
//  SearchViewMiddle.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 20.03.2024.
//

import SwiftUI

struct SearchViewMiddle: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
                ForEach(0...4, id: \.self) { item in
                    ZStack {
                        Rectangle()
                            .frame(width: 130, height: 120)
                            .foregroundStyle(Color.gray.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(alignment: .leading) {
                            Image("Setting")
                            Text("Вакансии рядом с вами")
                                .font(.system(size: 14))
                                .frame(width: 100)
                                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    SearchViewMiddle()
}
