//
//  File.swift
//  
//
//  Created by neutralradiance on 10/14/20.
//

import SwiftUI

struct PullView<Content: View>: View {
    private let threshold: CGFloat
    #if os(iOS)
    private let impact: UIImpactFeedbackGenerator.FeedbackStyle?
    #endif
    private let timeout: UInt32
    private let delay: DispatchTime
    private let content: Content
    private let action: () -> Void

    @State private var offset: CGFloat = 0
    @Binding private var isFinished: Bool

    var body: some View {
        GeometryReader { outer in
            ScrollView {
                ZStack(alignment: .top) {
                    GeometryReader { inner in
                        PullOverlay(threshold: threshold,
                                    impact: impact,
                                    timeout: timeout,
                                    delay: delay,
                                    offset: $offset,
                                    isFinished: $isFinished,
                                    action: action)
                            .async {
                                self.offset =
                                    outer.frame(in: .global).minY-inner.frame(in: .global).minY
                            }
                    }
                    .zIndex(1)
                    content.zIndex(0)
                }
            }
        }
    }

    public init(threshold: CGFloat,
                impact: UIImpactFeedbackGenerator.FeedbackStyle?,
                timeout: UInt32,
                delay: DispatchTime,
                isFinished: Binding<Bool>,
                action: @escaping () -> Void,
                content: Content) {
        self.threshold = threshold
        self.impact = impact
        self.timeout = timeout
        self.delay = delay
        self._isFinished = isFinished
        self.action = action
        self.content = content
    }
}
