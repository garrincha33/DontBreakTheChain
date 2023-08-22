//
//  Storageable.swift
//  DontBreakTheChain
//
//  Created by Richard Price on 22/08/2023.
//

import Foundation

protocol Storageable {
    func save<T: Encodable>(_ object: T, for key: String)
    func load<T: Decodable>(_ type: T.Type, with key: String) -> T?
    func removeValue(for key: String)
}
