//
//  File.swift
//
//
//  Created by neutralradiance on 10/22/20.
//

import SwiftUI

public struct SeratedTableStyle: TableStyle {
  public func body(content: Body) -> some View {
    content
  }

  public func content(content: Content) -> some View {
    content
      .contentStyle(DefaultTableContentStyle(separator: .dashed()))
  }

  public func row(content: Row) -> some View {
    content
      .rowStyle(SeratedRowStyle())
  }

  public init() {}
}
