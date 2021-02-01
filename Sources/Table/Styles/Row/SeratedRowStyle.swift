//
//  File.swift
//
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct SeratedRowStyle: RowStyle {
  let background: UIColor
  let separatorColor: UIColor
  public func body(content: Content) -> some View {
    content
      .rowStyle(
        PlainRowStyle(
          background,
          separator: .dashed(separatorColor),
          separatorLeadSpace: 0
        )
      )
  }

  public init(
    _ background: UIColor = .systemBackground,
    separatorColor: UIColor = .separator
  ) {
    self.background = background
    self.separatorColor = separatorColor
  }
}
