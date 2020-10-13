//
//  File.swift
//  
//
//  Created by neutralradiance on 10/11/20.
//

import Foundation

public struct AnyIdentifiable: Hashable, Identifiable {
    public var id: UUID { UUID() }
    public var value: AnyHashable
    public init<V: Hashable>(_ value: V) {
        self.value = value
    }
}

public extension AnyIdentifiable {
    static func hash(into hasher: inout Hasher) {
        hasher.combine(hasher.finalize())
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

public extension Sequence where Element: Hashable {
    var identify: [AnyIdentifiable] {
        self.map { value in
            guard let element = value as? AnyIdentifiable else {
                return AnyIdentifiable(value)
            }
            return element
        }
    }
}
