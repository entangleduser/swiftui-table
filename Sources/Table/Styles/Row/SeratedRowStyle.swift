//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct SeratedRowStyle: RowStyle {
    public func body(content: Content) -> some View {
        content
            .rowStyle(PlainRowStyle(separator: .dashed, separatorLeadSpace: 0))
    }

    public init() {}
}
