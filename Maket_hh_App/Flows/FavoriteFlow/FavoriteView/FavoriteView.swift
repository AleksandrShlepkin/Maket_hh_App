//
//  FavoriteView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 24.03.2024.
//

import SwiftUI

struct FavoriteView: View {
    
    var userDefault: StorageManagerProtocol = StorageManager()
    
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject var viewModel: SearhViewModel
    @StateObject var vacancy = FavoriteViewModel()
    @State var mark: Bool = false

    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(0...userDefault.getArray(.keyData).count, id: \.self) { index in
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 230)
                            .foregroundStyle(Color.gray.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(alignment: .leading, spacing: 5) {
                            HStack(spacing: 50) {
                                Text("Сейчас просматривает \(viewModel.vacancyModel?.vacancies[index].lookingNumber ?? 0) \(formaterCountHuman(_:viewModel.vacancyModel?.vacancies[index].lookingNumber ?? 0))")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.green)
                                .lineLimit(2)
                                
                                Image(systemName: mark ? "heart" : "heart.fill")
                                    .foregroundStyle(mark ? Color.gray : Color.red)
                                    .onTapGesture {
                                        
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
    FavoriteView()
}
