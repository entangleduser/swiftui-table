//
//  File.swift
//  
//
//  Created by neutralradiance on 10/14/20.
//

import SwiftUI

public struct PullView<Content: View>: View {
    let threshold: CGFloat
    let delay: DispatchTime
    let content: Content
    let action: () -> Void

    @State var offset: CGFloat = 0
    @Binding var isFinished: Bool

    public var body: some View {
        GeometryReader { outer in
            ScrollView {
                ZStack(alignment: .top) {
                    GeometryReader { inner in
                        PullOverlay(threshold: threshold,
                                    delay: delay,
                                    offset: $offset,
                                    isFinished: $isFinished,
                                    action: action).async {
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
                delay: DispatchTime,
                isFinished: Binding<Bool>,
                action: @escaping () -> Void,
                content: Content) {
        self.threshold = threshold
        self.delay = delay
        self._isFinished = isFinished
        self.action = action
        self.content = content
    }
}
