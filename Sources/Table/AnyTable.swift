//
//  File.swift
//
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public struct AnyTable: ListView {
    public typealias Element = AnyIdentifiable
    public typealias RowContent = TableRow
    public var elements: [Element] = []
    public var content: TableContent
    public var axis: Axis.Set = .vertical
    public var showsIndicators: Bool = true

    public var body: some View {
        ScrollView(axis, showsIndicators: showsIndicators) {
            content
                .maxFrame()
        }
        .maxFrame()
    }
}

public extension AnyTable {
    init<T: ListView>(_ table: T, _ content: TableContent) {
        self.elements = table.elements.identify
        self.content = content
        self.axis = table.axis
        self.showsIndicators = table.showsIndicators
    }
}
