//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct TableContent: View {
    public typealias Data = ForEach<[AnyIdentifiable], AnyIdentifiable.ID, TableRow>

    let data: Data?
    let wrapper: AnyView

    public var body: some View {
        wrapper
            .maxFrame()
    }
}

extension TableContent {
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
                guard
                    let element = element.value as? E else {
                    return TableRow()
                }
                return TableRow(content(element))
            }
        self.init(data: data)
    }
}
