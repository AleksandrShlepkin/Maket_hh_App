//
//  SearchViewHeader.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 20.03.2024.
//

import SwiftUI

struct SearchViewHeader: View {
    
    var body: some View {

                VStack {
                    HStack {
                        ZStack{
                            Rectangle()
                                .frame(width: 300, height: 50)
                                .foregroundColor(.gray.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            HStack{
                                Image("Search")
                                Text("Должность, ключевые слова")
                                    .foregroundStyle(Color(.lightGray))
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Image("Setting")
                        }
                    }
                }
    }
}

#Preview {
    SearchViewHeader()
}
