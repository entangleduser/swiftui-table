//
//  File.swift
//
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

extension View {
    func visibility(_ isVisible: Bool) -> some View {
        self.opacity(isVisible ? 1 : 0)
    }

    func invisible() -> some View {
        self.visibility(false)
    }

    func opaque() -> some View {
        self.visibility(true)
    }

    func maxFrame(align: Alignment = .topLeading) -> some View {
        self
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity, alignment: align)
    }

    func padding(x: CGFloat? = 0, y: CGFloat? = 0) -> some View {
        self
            .padding([.leading, .trailing], x)
            .padding([.top, .bottom], y)
    }

    func perform(action: @escaping () -> Void) -> some View {
        action()
        return self
    }

    func async(delay: DispatchTime = .now(), action: @escaping () -> Void) -> some View {
        self.perform {
            DispatchQueue.main.asyncAfter(deadline: delay) {
                action()
            }
        }
    }
}

public extension View {
    func separator(_ color: NativeColor = separatorColor, lineWidth: CGFloat = 1, dash: [CGFloat] = []) -> some View {
        self.overlay(
            GeometryReader { proxy in
                Path { path in
                    path.move(
                        to: CGPoint(x: proxy.frame(in: .global).minX,
                                    y: proxy.frame(in: .local).minY + proxy.frame(in: .local).size.height)
                    )
                    path.addLine(
                        to: CGPoint(x: proxy.frame(in: .global).maxX,
                                    y: proxy.frame(in: .local).minY + proxy.frame(in: .local).size.height)
                    )
                }
                .stroke(Color(color), style: StrokeStyle(lineWidth: lineWidth, dash: dash))
            }
            .offset(x: -12.5)
        )
    }

    func onPull(threshold: CGFloat = 80,
                impact: UIImpactFeedbackGenerator.FeedbackStyle? = .rigid,
                timeout: UInt32 = 10,
                delay: DispatchTime = .now(),
                isFinished: Binding<Bool>,
                perform: @escaping () -> Void) -> some View {
    PullView(threshold: threshold,
             impact: impact,
             timeout: timeout,
             delay: delay,
             isFinished: isFinished,
             action: perform,
             content: self)
    }
}
