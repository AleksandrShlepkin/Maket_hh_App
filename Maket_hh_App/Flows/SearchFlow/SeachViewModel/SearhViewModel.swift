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
}
