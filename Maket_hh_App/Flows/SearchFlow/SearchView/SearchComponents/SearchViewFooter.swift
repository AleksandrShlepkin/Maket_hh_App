//
//  SearchViewFooter.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 20.03.2024.
//

import SwiftUI

struct SearchViewFooter: View {
    
    var userDefault: StorageManagerProtocol = StorageManager()
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: SearhViewModel
    @EnvironmentObject var vacancy: VacancyViewModel
    @State var mark: Bool = false
    
    var body: some View {
        VStack {
            ForEach(0...1, id: \.self) { index in
                ZStack {
                    Rectangle()
                        .frame(maxWidth: 350, minHeight: 230)
                        .foregroundStyle(Color.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 50) {
                            Text("Сейчас просматривает \(viewModel.vacancyModel?.vacancies[index].lookingNumber ?? 0) \(formaterCountHuman(_:viewModel.vacancyModel?.vacancies[index].lookingNumber ?? 0))")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.green)
                                .lineLimit(2)
                            Button {
                                vacancy.vacancyModel = viewModel.vacancyModel?.vacancies[index]
                                addFavoriteVacansy(mark, key: .keyData, data: vacancy.vacancyModel)
                                mark.toggle()
                            } label: {
                                if addFavoriteVacansy(mark, key: .keyData, data: vacancy.vacancyModel) == false {
                                    Image(systemName: "heart")
                                        .foregroundStyle(Color.gray)
                                }else {
                                    Image(systemName:"heart.fill")
                                        .foregroundStyle(Color.red)
                                }
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
                        Text(viewModel.vacancyModel?.vacancies[index].publishedDate ?? "")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.gray)
                        Button {
                            vacancy.vacancyModel = viewModel.vacancyModel?.vacancies[index]
                            coordinator.fullScreenPresent(.description)
                        } label: {
                            Text("Откликнуться")
                                .frame(width: 296, height: 30)
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
            Button {
                coordinator.fullScreenPresent(.fullSearch)
            } label: {
                Text("Еще 143 вакансии")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
            }
        }
        .background(Color.black)
    }
    
    func addFavoriteVacansy(_ mark: Bool, key: UserKeys, data: Vacancy?) -> Bool {
        if mark == false, userDefault.checkKey(key) {
            userDefault.remove(forKey: key)
            return false
        } else {
            userDefault.setData(object: data, forKey: .keyData)
            return true
        }
    }
    
    func formaterCountHuman(_ count: Int) -> String {
        switch count {
        case 2...4:
            return "человека"
        case 22...24:
            return "человека"
        case 32...34:
            return "человека"
        case 42...44:
            return "человека"
        case 52...54:
            return "человека"
        case 62...64:
            return "человека"
        case 72...74:
            return "человека"
        case 82...84:
            return "человека"
        case 92...94:
            return "человека"
        default:
            return "человек"
        }
    }
}
#Preview {
    SearchViewFooter(mark: false)
}
