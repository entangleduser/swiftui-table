//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct SeratedInsetTableStyle: TableStyle {

    public func body(content: Body) -> some View {
        content
    }

    public func content(content: Content) -> some View {
            content
                .contentStyle(InsetContentStyle())
    }

    public func row(content: Row) -> some View {
        content
            .rowStyle(SeratedRowStyle())
    }

    public init() {}
}
