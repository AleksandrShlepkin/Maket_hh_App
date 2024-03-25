//
//  FullHeader.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 23.03.2024.
//

import SwiftUI

struct FullHeader: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            HStack {
                ZStack{
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    HStack{
                        Button("", image: .back) {
                            coordinator.pagePresent(.tab)
                        }
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
    FullHeader()
}
