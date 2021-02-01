//
//  File.swift
//
//
//  Created by neutralradiance on 10/11/20.
//

import SwiftUI

public struct AnyIdentifiable: Identifiable {
  public let id: AnyHashable
  let value: Any

  public init<ID: Hashable, Value>(id: ID, _ value: Value) {
    self.id = id
    self.value = value
  }
}

extension Sequence {
  func identifyAll() -> [AnyIdentifiable] {
    map { value in
      guard
        let element = value as? AnyIdentifiable else {
        return AnyIdentifiable(id: UUID(), value)
      }
      return element
    }
  }
}

extension Sequence where Element: Identifiable {
  var wrapAll: [AnyIdentifiable] {
    map { value in
      guard
        let element =
        value as? AnyIdentifiable else {
        return AnyIdentifiable(id: value.id, value)
      }
      return element
    }
  }
}

extension AnyIdentifiable: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(reflecting: value)
  }
}
