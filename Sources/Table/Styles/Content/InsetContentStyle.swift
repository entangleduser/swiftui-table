//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct InsetContentStyle: ContentStyle {
    var contentBackground: UIColor
    var cornerRadius: CGFloat
    var shadowColor: UIColor
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

    public init(_ background: UIColor = .systemGroupedBackground,
                contentBackground: UIColor = .systemBackground,
                cornerRadius: CGFloat = 15,
                shadowColor: UIColor = .secondaryLabel,
                shadowRadius: CGFloat = 0.5,
                shadowOffset: CGPoint = .zero) {
        UIScrollView.appearance(for: .current).backgroundColor = background
        UINavigationBar.appearance(for: .current).backgroundColor = .clear
        self.contentBackground = contentBackground
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
    }
}
