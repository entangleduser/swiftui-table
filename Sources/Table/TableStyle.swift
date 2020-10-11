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

public struct TableContent: View {
    public typealias Data = ForEach<[AnyIdentifiable], AnyIdentifiable.ID, TableRow>
    public var data: Data?
    public var wrapper: AnyView = AnyView(EmptyView())

    public var body: some View {
            wrapper
    }
}
public extension TableContent {
    init<V: View>(_ view: V, data: Data? = nil) {
        self.wrapper = AnyView(view)
        self.data = data
        }
    init(data: Data? = nil) {
        self.init(data, data: data)
    }
    init<E: Hashable, V: View>(_ elements: [E], @ViewBuilder content: @escaping (E) -> V) {
        let data =
            Data(elements.identify) { element in
                guard let element = element.value as? E else {
                    return TableRow()
                }
                return TableRow(content(element))
            }
        self.init(data: data)
    }
}

public extension ListView where Element: Hashable {
    func tableStyle<S>(_ style: S) -> some View where S: TableStyle {
        var contents = self.content
        if let data = contents.data {
            let data =
                TableContent.Data(self.elements.identify) { element in
                    TableRow(style.row(content: data.content(element)))
                }
            let wrapper = style.content(content: data)
            contents = TableContent(wrapper, data: contents.data)
        }
        return style.body(content: AnyTable(self, contents))
    }
}
