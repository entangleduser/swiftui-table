//
//  File.swift
//  
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public struct PlainRowStyle: RowStyle {
    public func body(content: Content) -> some View {
        content
            .background(Color(.systemBackground))
            .padding([.top, .bottom], 1.5)
            .padding([.leading, .trailing], 16)
    }
    public init() {}
}
