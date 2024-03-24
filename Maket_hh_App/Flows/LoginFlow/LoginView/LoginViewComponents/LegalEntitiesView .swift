//
//  LegalEntitiesView .swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 18.03.2024.
//

import SwiftUI

struct LegalEntitiesView: View {
    var body: some View {
            VStack(alignment: .leading) {
                Text("Поиск сотрудников")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(.bottom)
                Text("Размещение вакансий и доступ к базе резюме")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.white)

                    Text("Я ищу сотрудников")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .foregroundStyle(.white)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding()

            }
            .padding()
            .background(Color(hex: "222325"))
    }
}

#Preview {
    LegalEntitiesView()
}
