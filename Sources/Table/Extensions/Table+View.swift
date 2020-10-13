//
//  File.swift
//  
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public extension View {
    func modify<V: View>(@ViewBuilder content: (Self) -> V) -> some View {
        content(self)
    }
    func isVisible(_ isVisible: Bool) -> some View {
        modify { content in
            content.opacity(isVisible ? 1 : 0)
        }
    }
    func invisible() -> some View {
        modify { content in
            content.isVisible(false)
        }
    }
    func opaque() -> some View {
        modify { content in
            content.isVisible(true)
        }
    }
    func maxFrame(align: Alignment = .topLeading) -> some View {
        modify { content in
            content
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity, alignment: align)
        }
    }
    func constrainWidth(_ value: CGFloat, align: Alignment = .leading) -> some View {
        modify { content in
            content
                //.frame(maxWidth: value, alignment: align)
                .frame(minWidth: value, alignment: align)
        }
    }
    func constrainHeight(_ value: CGFloat, align: Alignment = .center) -> some View {
        modify { content in
            content
                //.frame(maxHeight: value, alignment: align)
                .frame(idealHeight: value, alignment: align)
        }
    }
    func padding(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        modify { content in
            content
                .padding([.leading, .trailing], x)
                .padding([.top, .bottom], y)
        }
    }
    func separator(_ color: UIColor = .separator, lineWidth: CGFloat = 1, dash: [CGFloat] = []) -> some View {
        modify { content in
            content
                .overlay(
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
    }
}
