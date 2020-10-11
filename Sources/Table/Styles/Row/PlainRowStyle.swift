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
            .padding([.top, .bottom], 11.5)
            .padding(.leading, 16)
    }
    public init() {}
}
