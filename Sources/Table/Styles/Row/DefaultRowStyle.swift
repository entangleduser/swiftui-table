//
//  File.swift
//  
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public struct DefaultRowStyle: RowStyle {
    public func body(content: Content) -> some View {
        Group {
        content
            .rowStyle(PlainRowStyle())
            Divider()
                .padding(.leading, 16)
        }
    }
    public init() {}
}
