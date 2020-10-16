//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct InsetTableContenStyle: TableContenStyle {
    private let background: UIColor
    private let contentBackground: NativeColor
    private let cornerRadius: CGFloat
    private let shadowColor: NativeColor
    private let shadowRadius: CGFloat
    private let shadowOffset: CGPoint

    public func body(content: Content) -> some View {
        content
            .contentStyle(DefaultTableContenStyle(showsLine: false))
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
                UIScrollView.appearance(for: .current).backgroundColor = background
                UINavigationBar.appearance(for: .current).backgroundColor = .clear
                #endif
            }
    }

    public init(_ background: NativeColor = groupedBackgroundColor,
                contentBackground: NativeColor = backgroundColor,
                cornerRadius: CGFloat = 15,
                shadowColor: NativeColor = secondaryLabelColor,
                shadowRadius: CGFloat = 0.5,
                shadowOffset: CGPoint = .zero) {
        self.background = background
        self.contentBackground = contentBackground
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
    }
}
