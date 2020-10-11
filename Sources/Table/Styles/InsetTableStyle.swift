//
//  File.swift
//
//
//  Created by neutralradiance on 10/10/20.
//

import SwiftUI

public struct InsetTableStyle: TableStyle {
    //var background: UIColor
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
                .background(Color(contentBackground))
                .cornerRadius(cornerRadius)
                .padding(x: 25, y: 11.5)
                .shadow(color: Color(shadowColor),
                        radius: shadowRadius,
                        x: shadowOffset.x,
                        y: shadowOffset.y)
    }
    public func row(content: Row) -> some View {
        content
            .rowStyle(DefaultRowStyle())
            .offset(x: 0, y: 7)
    }
    public init(_ background: UIColor = .systemBackground,
                contentBackground: UIColor = .systemBackground,
                cornerRadius: CGFloat = 15,
                shadowColor: UIColor = .darkGray,
                shadowRadius: CGFloat = 1,
                shadowOffset: CGPoint = .zero) {
        UIScrollView.appearance(for: .current).backgroundColor = background
        UINavigationBar.appearance(for: .current).backgroundColor = .clear
        //self.background = background
        self.contentBackground = contentBackground
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
    }
}
