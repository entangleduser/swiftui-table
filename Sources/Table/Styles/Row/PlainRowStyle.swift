//
//  File.swift
//
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public struct PlainRowStyle: RowStyle {
  private let background: UIColor
  private let separator: Table.SeparatorStyle
  private let topPadding: CGFloat
  private let bottomPadding: CGFloat
  private let leadPadding: CGFloat
  private let trailPadding: CGFloat
  private let separatorLeadSpace: CGFloat
  private let separatorTrailSpace: CGFloat

  public func body(content: Content) -> some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack(alignment: .center, spacing: 0) {
        content
          .padding(.top, topPadding)
          .padding(.bottom, bottomPadding)
          .padding(.leading, leadPadding)
          .padding(.trailing, trailPadding)
      }
      .background(Color(background))
      separator
        .padding(.leading, separatorLeadSpace)
        .padding(.trailing, separatorTrailSpace)
    }
  }

  public init(
    _ background: UIColor = .clear,
    separator: Table.SeparatorStyle = .plain(),
    topPadding: CGFloat = 0,
    bottomPadding: CGFloat = 0,
    leadPadding: CGFloat = 11.5,
    trailPadding: CGFloat = 11.5,
    separatorLeadSpace: CGFloat = 0,
    separatorTrailSpace: CGFloat = 0
  ) {
    self.background = background
    self.separator = separator
    self.topPadding = topPadding
    self.bottomPadding = bottomPadding
    self.leadPadding = leadPadding
    self.trailPadding = trailPadding
    self.separatorLeadSpace = separatorLeadSpace
    self.separatorTrailSpace = separatorTrailSpace
  }
}
