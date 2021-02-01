//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public struct PlainInsetTableStyle: TableStyle {
  public func body(content: Body) -> some View {
    content
      .tableStyle(
        InsetTableStyle(.systemGroupedBackground, shadowColor: .clear)
      )
  }

  public func content(content: Content) -> some View {
    content
  }

  public func row(content: Row) -> some View {
    content
  }

  public init() {}
}
