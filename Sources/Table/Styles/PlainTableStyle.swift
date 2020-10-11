//
//  File.swift
//
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public struct PlainTableStyle: TableStyle {
    public func body(content: Body) -> some View {
        content
    }
    public func content(content: Content) -> some View {
        content
    }
    public func row(content: Row) -> some View {
        content
            .rowStyle(PlainRowStyle())
    }
    public init() {}
}
