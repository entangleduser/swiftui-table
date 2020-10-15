//
//  File.swift
//  
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public struct PlainRowStyle: RowStyle {
    private let background: NativeColor
    private let separator: Table.SeparatorStyle
    private let topPadding: CGFloat
    private let bottomPadding: CGFloat
    private let leadPadding: CGFloat
    private let trailPadding: CGFloat
    private let separatorLeadSpace: CGFloat
    private let separatorTrailSpace: CGFloat

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
