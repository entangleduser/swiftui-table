//
//  File.swift
//
//
//  Created by neutralradiance on 10/10/20.
//

import SwiftUI

public struct InsetTableStyle: TableStyle {
    var background: UIColor
    var contentBackground: UIColor
    var cornerRadius: CGFloat
    var shadowColor: UIColor
    var shadowRadius: CGFloat
    var shadowOffset: CGPoint

    public func body(content: Body) -> some View {
        content
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

    public init(_ background: UIColor = .systemGroupedBackground,
                contentBackground: UIColor = .systemBackground,
                cornerRadius: CGFloat = 15,
                shadowColor: UIColor = .secondaryLabel,
                shadowRadius: CGFloat = 0.5,
                shadowOffset: CGPoint = .zero) {
//        UIScrollView.appearance(for: .current).backgroundColor = background
//        UINavigationBar.appearance(for: .current).backgroundColor = .clear
        self.background = background
        self.contentBackground = contentBackground
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
    }
}
