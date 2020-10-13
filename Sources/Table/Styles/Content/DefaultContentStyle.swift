//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct DefaultContentStyle: ContentStyle {
    public var showsLine: Bool

    public func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 11.5) {
            Divider()
                .padding(.leading, 16)
                .isVisible(showsLine)
            content
        }
        .background(Color(.systemBackground))
    }

    public init(showsLine: Bool = true) {
        self.showsLine = showsLine
    }
}
