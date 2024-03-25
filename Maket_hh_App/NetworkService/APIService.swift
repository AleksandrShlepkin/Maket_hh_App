//
// APIService.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 21.03.2024.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func getData() -> AnyPublisher<Welcome, Error>

}

final class APIService: APIServiceProtocol {
    
    let apiManager = NetworkManager<NetworkApi>()
    
    func getData() -> AnyPublisher<Welcome, Error> {
        apiManager.request(.vacancies)
    }
    

}
