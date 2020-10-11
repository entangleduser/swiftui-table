//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public struct DefaultTableStyle: TableStyle {
    public func body(content: Body) -> some View {
        content
    }
    public func content(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            content
        }
            .background(Color(.systemBackground))
    }
    public func row(content: Row) -> some View {
        content
        .rowStyle(DefaultRowStyle())
    }
    public init() {}
}
