//
//  File.swift
//  
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public struct PlainRowStyle: RowStyle {
    public var background: NativeColor
    public var separator: Table.SeparatorStyle
    public var topPadding: CGFloat
    public var bottomPadding: CGFloat
    public var leadPadding: CGFloat
    public var trailPadding: CGFloat
    public var separatorLeadSpace: CGFloat
    public var separatorTrailSpace: CGFloat

    public func body(content: Content) -> some View {
        VStack {
            Group {
                content
                    .padding(.top, topPadding)
                    .padding(.bottom, bottomPadding+3)
                    .padding(.leading, leadPadding)
                    .padding(.trailing, trailPadding)
            }
            separator.body
                .padding(.leading, separatorLeadSpace)
                .padding(.trailing, separatorTrailSpace)
        }
        .background(Color(background))
    }

    public init(_ background: NativeColor = .clear,
                separator: Table.SeparatorStyle = .plain,
                topPadding: CGFloat = 0,
                bottomPadding: CGFloat = 0,
                leadPadding: CGFloat = 16,
                trailPadding: CGFloat = 16,
                separatorLeadSpace: CGFloat = 16,
                separatorTrailSpace: CGFloat = 0) {
        self.background = background
        self.separator = separator
        self.topPadding = topPadding
        self.bottomPadding = bottomPadding
        self.leadPadding = leadPadding
        self.trailPadding = trailPadding
        self.separatorLeadSpace = separatorLeadSpace
        self.separatorTrailSpace = separatorTrailSpace
    }

}
