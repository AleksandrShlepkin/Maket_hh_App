//
//  DescriptionViewFooter.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 24.03.2024.
//

import SwiftUI

struct DescriptionViewFooter: View {
    
    @EnvironmentObject var viewModel: VacancyViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.vacancyModel?.title ?? "Nill")
                    .font(.title)
                    .foregroundStyle(Color.white)
                Text(viewModel.vacancyModel?.salary.full ?? "Nill")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.white)
                Text("Требуемый опыт \(viewModel.vacancyModel?.experience.text ?? "Nill")")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.white)
                Text(viewModel.vacancyModel?.schedules.first ?? "Nill")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.white)
                
                HStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundStyle(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Rectangle()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundStyle(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .foregroundStyle(Color(.darkGray))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.vacancyModel?.company ?? "")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.white)
                        
                        Image(.map)
                            .frame(width: 300, height: 60)
                        
                        Text("\(viewModel.vacancyModel?.address.town ?? ""), \(viewModel.vacancyModel?.address.street ?? ""), \(viewModel.vacancyModel?.address.house ?? "")")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                    }
                    .padding()
                }
                .padding()
                
                Text(viewModel.vacancyModel?.description ?? "")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.white)
                    .lineLimit(20)
                
                Text("Ваши задачи")
                    .font(.title)
                    .foregroundStyle(Color.white)
                
                Text(viewModel.vacancyModel?.responsibilities ?? "")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.white)
                    .lineLimit(20)
                
                Text("Задайте вопрос работодателю")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.white)
                    .bold()
                
                Text("Он получит его с откликом на вакансию")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(.darkGray))
                
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(viewModel.vacancyModel?.questions ?? [""], id: \.self) { text in
                        Text(text)
                            .padding(10)
                            .background(Color(.darkGray))
                            .font(.system(size: 13))
                            .foregroundStyle(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Откликнуться")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundStyle(.white)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.top)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black)
        }
    }
}

#Preview {
    DescriptionViewFooter()
}
