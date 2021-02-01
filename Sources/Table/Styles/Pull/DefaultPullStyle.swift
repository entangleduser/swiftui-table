//
//  File.swift
//
//
//  Created by neutralradiance on 10/16/20.
//

import SwiftUI

public struct DefaultPullStyle: PullStyle {
  public func body(content: Content) -> some View {
    content
  }

  public func makeOverlay(config _: Configuration) -> some View {
    EmptyView()
    /*
            ProgressView(value: config.isLoading ? 1 : config.percent)
                .progressViewStyle(ArrowProgressStyle())
                .maxFrame(align: .center)
                .fixedSize(horizontal: false, vertical: true)
                .offset(y: -48)
                .opacity(Double(config.isLoading ? 1 : config.percent))
                .onAppear {
                    UIScrollView.appearance(for: .current).backgroundColor = .systemGroupedBackground
                }
     */
  }

  public init() {
//        UIScrollView.appearance(for: .current).systemBackground = .systemGroupedBackground
  }
}
