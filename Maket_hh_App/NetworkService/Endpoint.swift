//
//  Endpoint.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 21.03.2024.
//

import Foundation

protocol APIEndpoinType {
    var baseURL: URL { get }
    var HTTPMethod: HTTPMethod { get }
    var path: String { get }
}

public enum HTTPMethod: String {
    case get = "GET"
}

public enum APIError: Error {
    case invalidResponse
    case invalidData
}
