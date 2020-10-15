//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct TableRow: View {
    private var content: AnyView = AnyView(EmptyView())

    public var body: some View {
            content
                .buttonStyle(defaultButtonStyle)
                .maxFrame()
    }
}

public extension TableRow {
    init<V: View>(_ view: V) {
        self.content = AnyView(view)
    }
}
