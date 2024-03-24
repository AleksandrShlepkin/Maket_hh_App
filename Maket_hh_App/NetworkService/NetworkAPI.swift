//
//  NetworkAPI.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 21.03.2024.
//

import Foundation

public enum NetworkApi {
    case vacancies, offers
}

extension NetworkApi: APIEndpoinType {
    
    var baseURL: URL { URL(string: "https://run.mocky.io/v3/")!}
    
    var HTTPMethod: HTTPMethod {
        .get
    }
    
    var path: String {
        switch self {
        case .vacancies:
            return "ed41d10e-0c1f-4439-94fa-9702c9d95c14"
        case .offers:
            return "ed41d10e-0c1f-4439-94fa-9702c9d95c14"

        }
    }
}
