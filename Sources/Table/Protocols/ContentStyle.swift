//
//  File.swift
//
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public protocol TableContentStyle {
  typealias Content = TableContent.Wrapper
  associatedtype ModifiedContent: View
  func body(content: Content) -> ModifiedContent
}

public extension TableContent.Wrapper {
  func contentStyle<S>(_ style: S) -> some View
    where S: TableContentStyle {
    style.body(content: self)
  }
}
