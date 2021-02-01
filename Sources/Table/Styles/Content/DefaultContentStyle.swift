//
//  File.swift
//
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct DefaultTableContentStyle: TableContentStyle {
  let showsLine: Bool
  let separator: Table.SeparatorStyle
  let leadPadding: CGFloat
  let trailPadding: CGFloat

  public func body(content: Content) -> some View {
    content
      .background(Color(.systemBackground))
      .modifier(
        BorderModifier(showsLine: showsLine,
                       separator: separator,
                       leadPadding: leadPadding,
                       trailPadding: trailPadding)
      )
  }

  public init(
    showsLine: Bool = true,
    separator: Table.SeparatorStyle = .plain(),
    leadPadding: CGFloat = 0,
    trailPadding: CGFloat = 0
  ) {
    self.showsLine = showsLine
    self.separator = separator
    self.leadPadding = leadPadding
    self.trailPadding = trailPadding
  }
}
