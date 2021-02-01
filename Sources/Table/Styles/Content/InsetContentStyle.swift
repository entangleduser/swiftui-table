//
//  File.swift
//
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct InsetTableContentStyle: TableContentStyle {
  private let background: UIColor
  private let contentBackground: UIColor
  private let cornerRadius: CGFloat
  private let shadowColor: UIColor
  private let shadowRadius: CGFloat
  private let shadowOffset: CGPoint

  public func body(content: Content) -> some View {
    content
      .contentStyle(DefaultTableContentStyle(showsLine: false))
      .offset(y: 1)
      .background(Color(contentBackground))
      .maxFrame(align: .center)
      .cornerRadius(cornerRadius)
      .padding(x: 25, y: 11.5)
      .shadow(color: Color(shadowColor),
              radius: shadowRadius,
              x: shadowOffset.x,
              y: shadowOffset.y)
      .onAppear {
        #if os(iOS)
          UIScrollView.appearance(for: .current)
            .backgroundColor = background
          UINavigationBar.appearance(for: .current)
            .backgroundColor = .clear
        #endif
      }
  }

  public init(
    _ background: UIColor = .systemGroupedBackground,
    contentBackground: UIColor = .systemBackground,
    cornerRadius: CGFloat = 15,
    shadowColor: UIColor = .secondaryLabel,
    shadowRadius: CGFloat = 0.5,
    shadowOffset: CGPoint = .zero
  ) {
    self.background = background
    self.contentBackground = contentBackground
    self.cornerRadius = cornerRadius
    self.shadowColor = shadowColor
    self.shadowRadius = shadowRadius
    self.shadowOffset = shadowOffset
  }
}
