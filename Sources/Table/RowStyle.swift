//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public protocol RowStyle {
    typealias Content = TableRow
    associatedtype ModifiedRow: View
    func body(content: Content) -> ModifiedRow
    init()
}

public struct TableRow: View {
    var content: AnyView = AnyView(EmptyView())
    public var body: some View {
            content
                .maxFrame()
    }
}

public extension TableRow {
    init<V: View>(_ view: V) {
        self.content = AnyView(view)
    }
    func rowStyle<Style>(_ style: Style) -> some View where Style: RowStyle {
        style.body(content: self)
    }
}
