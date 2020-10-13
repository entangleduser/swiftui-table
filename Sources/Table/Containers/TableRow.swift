//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct TableRow: View {
    var content: AnyView = AnyView(EmptyView())
    public var body: some View {
            content
                .maxFrame()
    }
}

extension TableRow {
    public init<V: View>(_ view: V) {
        self.content = AnyView(view)
    }
}
