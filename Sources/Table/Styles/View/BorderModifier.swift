//
//  File.swift
//  
//
//  Created by neutralradiance on 10/13/20.
//

import SwiftUI

public struct BorderModifier: ViewModifier {
    public var showsLine: Bool

    public func body(content: Content) -> some View {
        Group {
            if showsLine {
                VStack(spacing: 0) {
                    Divider()
                    content
                }
            } else {
                content
            }
        }
    }

    public init(showsLine: Bool = true) {
        self.showsLine = showsLine
    }
}
