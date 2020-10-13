//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct Separator: View {
    public var color: NativeColor = separatorColor
    public var lineWidth: CGFloat = 0.5
    public var dash: [CGFloat] = []
    public var body: some View {
        Divider().invisible()
            .separator(color, lineWidth: lineWidth, dash: dash)
            .offset(y: -0.5)
    }

    public init(color: NativeColor = separatorColor, lineWidth: CGFloat = 0.5, dash: [CGFloat] = []) {
        self.color = color
        self.lineWidth = lineWidth
        self.dash = dash
    }
}
