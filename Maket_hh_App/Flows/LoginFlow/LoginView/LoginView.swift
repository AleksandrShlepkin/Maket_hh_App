//
//  LoginView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 18.03.2024.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
            ScrollView{
                    HStack {
                        Text("Вход в личный кабинет")
                            .font(.title2)
                            .foregroundStyle(Color.white)
                        Spacer()
                    }
                    .padding()
                
                    VStack {
                        IndividualsView()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        LegalEntitiesView()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    .padding()
            }
            .background(Color.black)
        }
}

#Preview {
    LoginView()
}
