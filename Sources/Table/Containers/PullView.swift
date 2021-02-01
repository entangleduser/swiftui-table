//
//  File.swift
//
//
//  Created by neutralradiance on 10/14/20.
//

import SwiftUI

public struct PullView: View {
  private let threshold: CGFloat
  #if os(iOS)
    private let impact: UIImpactFeedbackGenerator.FeedbackStyle?
    private var impactGenerator: UIImpactFeedbackGenerator? {
      guard let impact = impact else { return nil }
      return UIImpactFeedbackGenerator(style: impact)
    }
  #endif
  private let timeout: UInt32
  private let delay: DispatchTime
  private let action: () -> Void
  var overscrollAction: (() -> Void)?
  var overscrollOffset: CGFloat = 1

  @State var overscroll: CGFloat = -99999

  @State var offset: CGFloat = 0
  @Binding var isFinished: Bool
  @ObservedObject var config = Config()
  var content: PullContent
  var overlay: PullContent.Overlay

  public var body: some View {
    GeometryReader { outer in
      ScrollView {
        ZStack(alignment: .top) {
          GeometryReader { inner in
            PullContent.Overlay(
              DefaultPullStyle().makeOverlay(config: config)
            )
            .async {
              guard !isFinished else {
                isFinished = false
                return
              }
              self.offset =
                outer.frame(in: .global)
                  .minY - inner.frame(in: .global).minY
              let offset = self.offset.clamp(threshold, 0)
              config.percent = (offset / threshold).clamp(0, 1)

              if offset == threshold {
                guard !config.isLoading else { return }

                config.isLoading = true

                #if os(iOS)
                  impactGenerator?.impactOccurred()
                #endif

                DispatchQueue.global()
                  .asyncAfter(deadline: delay) {
                    action()
                    DispatchQueue.main.async {
                      config.isLoading = false
                    }
                  }
              }
              if let action = overscrollAction {
                self.overscroll =
                  outer.frame(in: .global)
                    .maxY - inner.frame(in: .global).maxY
                if overscroll.clamp(
                  -.infinity, overscrollOffset
                ) == overscrollOffset {
                  DispatchQueue.global().async {
                    action()
                  }
                }
              }
            }
          }
          .zIndex(1)
          content.zIndex(0)
        }
      }
    }
  }

  public init<V: View>(
    threshold: CGFloat,
    impact: UIImpactFeedbackGenerator.FeedbackStyle?,
    timeout: UInt32,
    delay: DispatchTime,
    isFinished: Binding<Bool>,
    content: V,
    action: @escaping () -> Void
  ) {
    _isFinished = isFinished
    self.threshold = threshold
    self.impact = impact
    self.timeout = timeout
    self.delay = delay
    self.content = PullContent(content)
    self.action = action
    overlay =
      PullContent.Overlay(
        EmptyView()
      )
  }
}

public extension PullView {
  class Config: ObservableObject {
    /// The fraction of pull from the offset to the threshold.
    @Published public var percent: CGFloat = 0
    @Published public var isLoading: Bool = false
  }
}
