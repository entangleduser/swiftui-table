//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct InsetContentStyle: ContentStyle {
    var contentBackground: NativeColor
    var cornerRadius: CGFloat
    var shadowColor: NativeColor
    var shadowRadius: CGFloat
    var shadowOffset: CGPoint

    public func body(content: Content) -> some View {
            content
                .contentStyle(DefaultContentStyle(showsLine: false))
                .offset(y: 1)
                .background(Color(contentBackground))
                .cornerRadius(cornerRadius)
                .padding(x: 25, y: 11.5)
                .shadow(color: Color(shadowColor),
                        radius: shadowRadius,
                        x: shadowOffset.x,
                        y: shadowOffset.y)
    }

    public init(_ background: NativeColor = groupedBackgroundColor,
                contentBackground: NativeColor = backgroundColor,
                cornerRadius: CGFloat = 15,
                shadowColor: NativeColor = secondaryLabelColor,
                shadowRadius: CGFloat = 0.5,
                shadowOffset: CGPoint = .zero) {
        #if os(iOS)
        UIScrollView.appearance().backgroundColor = background
        UINavigationBar.appearance(for: .current).backgroundColor = .clear
        #endif
        self.contentBackground = contentBackground
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
    }
}
