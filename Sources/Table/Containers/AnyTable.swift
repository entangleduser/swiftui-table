//
//  File.swift
//
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public struct AnyTable: ListView {
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
        self.content = content
        self.axis = table.axis
        self.showsIndicators = table.showsIndicators
    }
}
