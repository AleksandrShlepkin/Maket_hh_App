//
//  NetworkManager.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 21.03.2024.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    associatedtype EndopoinType: APIEndpoinType
    func request<T: Decodable>(_ endopoint: EndopoinType) -> AnyPublisher<T, Error>
}

final class NetworkManager<EndopoinType: APIEndpoinType>: NetworkManagerProtocol {
    
    func request<T>(_ endopoint: EndopoinType) -> AnyPublisher<T, Error> where T : Decodable {
        let url = endopoint.baseURL.appendingPathComponent(endopoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endopoint.HTTPMethod.rawValue
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {

                    throw APIError.invalidResponse
                }

                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
