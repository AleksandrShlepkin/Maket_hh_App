//
//  FavoriteModel.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 24.03.2024.
//

import Foundation

struct VacancyModel: Codable, Identifiable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}
