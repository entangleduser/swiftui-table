//
//  File.swift
//
//
//  Created by neutralradiance on 10/17/20.
//

import SwiftUI

public struct LinearPullStyle: PullStyle {
  public func body(content: Content) -> some View {
    content
  }

  public func makeOverlay(config _: Configuration) -> some View {
    EmptyView()
    /*
            ProgressView(value: config.isLoading ? 1 : config.percent)
                .progressViewStyle(LinearProgressViewStyle())
                .maxFrame(align: .center)
                .fixedSize(horizontal: false, vertical: true)
                .opacity(Double(config.isLoading ? 1 : config.percent))
     */
  }

  public init() {}
}
