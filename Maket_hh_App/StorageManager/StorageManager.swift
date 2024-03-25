//
//  StorageManager.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 24.03.2024.
//

import Foundation

public enum UserKeys: String {
    case key
    case keyData
}

protocol StorageManagerProtocol {
    func set(_ object: Any?, forKey key: UserKeys)
    func setData<T: Encodable>(object: T?, forKey key: UserKeys)

    func data(forKey key: UserKeys) -> Data?
    func codableData<T: Decodable>(forKey key:  UserKeys) -> T?
    
    func remove(forKey key: UserKeys)
    
    func checkKey(_ key: UserKeys) -> Bool 
    
    func getArray(_ key: UserKeys) -> [Any]
}

final class StorageManager {


    private let userDefaults = UserDefaults.standard

    private func store(_ object: Any?, key: String) {
        DispatchQueue.global(qos: .userInteractive).async {
            self.userDefaults.set(object, forKey: key)
        }
    }
    
    private func array(forKey key: UserKeys) -> [Any] {
        userDefaults.array(forKey: key.rawValue) ?? ["Nill"]
    }

    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

extension StorageManager: StorageManagerProtocol {
    func set(_ object: Any?, forKey key: UserKeys) {
        store(object, key: key.rawValue)
    }

    func setData<T: Encodable>(object: T?, forKey key: UserKeys) {
        let jsonData = try? JSONEncoder().encode(object)
        store(jsonData, key: key.rawValue)
    }

    func data(forKey key: UserKeys) -> Data? {
        restore(forKey: key.rawValue) as? Data
    }

    func codableData<T: Decodable>(forKey key: UserKeys) -> T? {
        guard let data = restore(forKey: key.rawValue) as? Data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    func remove(forKey key: UserKeys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
    
    func checkKey(_ key: UserKeys) -> Bool {
        (userDefaults.object(forKey: key.rawValue) != nil)
    }
    
    func getArray(_ key: UserKeys) -> [Any] {
        array(forKey: key)
    }
}
