//
//  File.swift
//
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct SeratedInsetTableStyle: TableStyle {
  private let showsLine: Bool

  public func body(content: Body) -> some View {
    content
  }

  public func content(content: Content) -> some View {
    content
      .contentStyle(InsetTableContentStyle())
      .modifier(BorderModifier(showsLine: showsLine))
  }

  public func row(content: Row) -> some View {
    content
      .rowStyle(SeratedRowStyle())
  }

  public init(showsLine: Bool = false) {
    self.showsLine = showsLine
  }
}
