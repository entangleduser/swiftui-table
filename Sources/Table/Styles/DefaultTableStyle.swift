//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public struct DefaultTableStyle: TableStyle {
    public func body(content: Body) -> some View {
        Group {
            Divider().padding(.leading, 16)
            content
        }
    }
    public func content(content: Content) -> some View {
            content
                .background(Color(.systemBackground))
    }
    public func row(content: Row) -> some View {
        content
            .rowStyle(DefaultRowStyle())
    }
    public init() {}
}
