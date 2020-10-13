//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public protocol TableStyle {
    typealias Body = AnyTable
    typealias Content = TableContent.Data
    typealias Row = TableRow
    associatedtype ModifiedBody: View
    associatedtype ModifiedContent: View
    associatedtype ModifiedRow: View
    func body(content: Body) -> ModifiedBody
    func content(content: Content) -> ModifiedContent
    func row(content: Row) -> ModifiedRow
}

public extension ListView {
    func tableStyle<S>(_ style: S) -> some View where S: TableStyle {
        var content = self.content
        if let data = content.data {
            let tmp =
                TableContent.Data(data.data) { element in
                    TableRow(style.row(content: data.content(element))
                    )
                }
            let wrapper = style.content(content: tmp)
            content = TableContent(wrapper, data: data)
        }
        return style.body(content: AnyTable(self, content))
    }
}
