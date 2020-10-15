//
//  File.swift
//  
//
//  Created by neutralradiance on 10/11/20.
//

import Foundation

public struct AnyIdentifiable: Hashable, Identifiable {
    let value: AnyHashable
    init<V: Hashable>(_ value: V) {
        self.value = value
    }
}

public extension AnyIdentifiable {
    var id: UUID { UUID() }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension Sequence where Element: Hashable {
    var identify: [AnyIdentifiable] {
        self.map { value in
            guard
                let element = value as? AnyIdentifiable else {
                return AnyIdentifiable(value)
            }
            return element
        }
    }
}
