//
//  UserDefaultsStorage.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

struct UserDefaultsStorage: Storageable {
    let userDefaults: UserDefaults = .standard

    func save<T>(_ object: T, for key: String) where T: Encodable {
        if let encoded = try? JSONEncoder().encode(object) {
            userDefaults.set(encoded, forKey: key)
        }
    }

    func load<T>(_ type: T.Type, with key: String) -> T? where T: Decodable {
        if let data = userDefaults.data(forKey: key) {
            return try? JSONDecoder().decode(type, from: data)
        }
        return nil
    }

    func removeValue(for key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
