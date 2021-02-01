//
//  File.swift
//
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct Separator: View {
  private let color: UIColor?
  private let lineWidth: CGFloat
  private let dash: [CGFloat]

  public var body: some View {
    Divider()
      .invisible()
      .separator(
        color ?? .separator,
        lineWidth: lineWidth,
        dash: dash
      )
      .offset(y: -0.5)
  }

  public init(
    color: UIColor? = nil,
    lineWidth: CGFloat = 0.5,
    dash: [CGFloat] = []
  ) {
    self.color = color
    self.lineWidth = lineWidth
    self.dash = dash
  }
}
