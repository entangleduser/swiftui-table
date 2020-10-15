//
//  File.swift
//
//
//  Created by neutralradiance on 10/10/20.
//

import SwiftUI

public struct InsetTableStyle: TableStyle {
    private let background: NativeColor
    private let contentBackground: NativeColor
    private let cornerRadius: CGFloat
    private let shadowColor: NativeColor
    private let shadowRadius: CGFloat
    private let shadowOffset: CGPoint
    private let showsLine: Bool

    public func body(content: Body) -> some View {
            content
                .modifier(BorderModifier(showsLine: showsLine))
    }

    public func content(content: Content) -> some View {
        content
            .contentStyle(
                InsetContentStyle(
                    background,
                    contentBackground: contentBackground,
                    cornerRadius: cornerRadius,
                    shadowColor: shadowColor,
                    shadowRadius: shadowRadius,
                    shadowOffset: shadowOffset
                )
            )
    }

    public func row(content: Row) -> some View {
        content
            .rowStyle(DefaultRowStyle())
    }

    public init(_ background: NativeColor = groupedBackgroundColor,
                contentBackground: NativeColor = backgroundColor,
                cornerRadius: CGFloat = 15,
                shadowColor: NativeColor = secondaryLabelColor,
                shadowRadius: CGFloat = 0.5,
                shadowOffset: CGPoint = .zero,
                showsLine: Bool = false) {
        self.background = background
        self.contentBackground = contentBackground
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
        self.showsLine = showsLine
    }
}
