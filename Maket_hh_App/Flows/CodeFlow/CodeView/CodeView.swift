//
//  CodeView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 19.03.2024.
//

import SwiftUI

struct CodeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State var text = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Отправили код на example@mail.ru")
                .font(.title2)
                .foregroundStyle(Color(.white))
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .foregroundStyle(Color(.white))
            
            HStack {
                VerificationCodeTextFieldView( cells: 4)
            }
            
        }
        .frame(maxHeight: .infinity)
        .background(Color.black)

    }

}

#Preview {
    CodeView()
}
