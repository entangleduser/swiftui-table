//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public struct DefaultRowStyle: RowStyle {
  public func body(content: Content) -> some View {
    content
      .rowStyle(PlainRowStyle(
        .systemBackground,
        separatorLeadSpace: 16
      )
      )
  }

  public init() {}
}
