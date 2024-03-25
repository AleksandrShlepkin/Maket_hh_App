//
//  SearhViewModel.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 21.03.2024.
//

import Foundation
import Combine

final class SearhViewModel: ObservableObject {
    
    private var cancellbales = Set<AnyCancellable>()
    
    @Published var vacancyModel: Welcome?
    
    let networkService: APIServiceProtocol?
    
    init(networkService: APIServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchVacancy() {
        networkService?.getData()
            .receive(on: DispatchQueue.main )
            .sink { data in
                
            } receiveValue: { [weak self] data in
                self?.vacancyModel = data
            }
            .store(in: &cancellbales)
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
