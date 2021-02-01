//
//  File.swift
//
//
//  Created by neutralradiance on 10/14/20.
//

import Foundation

extension Comparable {
  func clamp(_ lhs: Self, _ rhs: Self) -> Self {
    min(max(self, lhs), rhs)
  }
}
