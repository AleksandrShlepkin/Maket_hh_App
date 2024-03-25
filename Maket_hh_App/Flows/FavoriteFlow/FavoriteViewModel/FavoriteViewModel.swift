//
//  FavoriteViewModel.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 24.03.2024.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
    
    @Published var vacancy: [VacancyModel]?
    
    @Published var array: [Any]?

    var userDefault: StorageManagerProtocol = StorageManager()
    
    func getData() -> Array<Any> {
        
        self.array?.append(userDefault.getArray(.keyData))
        return array ?? []
    }
}
