//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public protocol RowStyle {
  typealias Content = TableRow
  associatedtype ModifiedRow: View
  func body(content: Content) -> ModifiedRow
}

public extension TableRow {
  func rowStyle<S>(_ style: S) -> some View where S: RowStyle {
    style.body(content: self)
  }
}
