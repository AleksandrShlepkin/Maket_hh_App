//
//  FullFooter.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 23.03.2024.
//

import SwiftUI

struct FullFooter: View {
    
    var userDefault: StorageManagerProtocol = StorageManager()
    
    @EnvironmentObject var viewModel: SearhViewModel
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject var vacancy: VacancyViewModel
    @State var mark: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(0...5, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: 370, minHeight: 230)
                            .foregroundStyle(Color.gray.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(alignment: .leading, spacing: 5) {
                            HStack(spacing: 50) {
                                Text("Сейчас просматривает \(viewModel.vacancyModel?.vacancies[index].lookingNumber ?? 0) \(viewModel.formaterCountHuman(_:viewModel.vacancyModel?.vacancies[index].lookingNumber ?? 0))")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.green)
                                    .lineLimit(2)
                                
                                Image(systemName: mark ? "heart" : "heart.fill")
                                    .foregroundStyle(mark ? Color.gray : Color.red)
                                    .onTapGesture {
                                        vacancy.vacancyModel = viewModel.vacancyModel?.vacancies[index]
                                        addFavoriteVacansy(mark, key: .keyData, data: vacancy.vacancyModel!)
                                        mark.toggle()
                                    }
                            }
                            Text(viewModel.vacancyModel?.vacancies[index].title ?? "")
                                .font(.title3)
                                .foregroundStyle(Color.white)
                            Text(viewModel.vacancyModel?.vacancies[index].address.town ?? "")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.white)
                            HStack {
                                Text(viewModel.vacancyModel?.vacancies[index].company ?? "")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.white)
                                Image("Verify")
                            }
                            HStack {
                                Image("Bag")
                                Text(viewModel.vacancyModel?.vacancies[index].experience.previewText ?? "")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.white)
                            }
                            Text("Опубликовано 20 февраля")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.gray)
                            
                            Button {
                                vacancy.vacancyModel = viewModel.vacancyModel?.vacancies[index]
                                coordinator.fullScreenPresent(.description)
                            } label: {
                                Text("Откликнуться")
                                    .frame(maxWidth: 250, maxHeight: 30)
                                    .foregroundStyle(.white)
                                    .background(Color.green)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(.top)
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchVacancy()
                }
            }
            .background(Color.black)
            .frame(maxWidth: .infinity)
        }
        .scrollIndicators(.hidden)
        .background(Color.black)
        .environmentObject(vacancy)
    }
    
    func addFavoriteVacansy(_ mark: Bool, key: UserKeys, data: Vacancy) {
        if mark == false, userDefault.checkKey(key) {
            userDefault.remove(forKey: key)
        } else {
            userDefault.setData(object: data, forKey: key)
        }
    }
    
}


#Preview {
    FullFooter()
}
