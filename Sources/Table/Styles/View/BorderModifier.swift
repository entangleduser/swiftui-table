//
//  File.swift
//
//
//  Created by neutralradiance on 10/13/20.
//

import SwiftUI

public struct BorderModifier: ViewModifier {
  let showsLine: Bool
  let separator: Table.SeparatorStyle
  let leadPadding: CGFloat
  let trailPadding: CGFloat
  @ViewBuilder
  public func body(content: Content) -> some View {
    if showsLine {
      VStack(spacing: 0) {
        separator
          .padding(.leading, leadPadding)
          .padding(.trailing, trailPadding)
        content
      }
    } else {
      content
    }
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
