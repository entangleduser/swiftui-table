//
//  File.swift
//  
//
//  Created by neutralradiance on 10/11/20.
//

import Foundation

public struct AnyIdentifiable: Hashable, Identifiable {
    public static func hash(into hasher: inout Hasher) {
        hasher.combine(hasher.finalize())
    }
    public static func == (lhs: AnyIdentifiable, rhs: AnyIdentifiable) -> Bool {
        lhs.id == rhs.id
    }
    public var id: UUID { UUID() }
    public var value: AnyHashable
    public init<E: Hashable>(_ value: E) {
        self.value = value
    }
}
public extension Array where Element: Hashable {
    var identify: [AnyIdentifiable] {
        self.map { value in
            guard let element = value as? AnyIdentifiable else {
                return AnyIdentifiable(value)
            }
            return element
        }
    }
}
