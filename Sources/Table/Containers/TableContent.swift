//
//  File.swift
//
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct TableContent: DynamicViewContent {
  public typealias Wrapper = ForEach<Data, AnyHashable, TableRow>
  public var wrapper: Wrapper

  public typealias Data = [AnyHashable]
  public var data: Data = []

  public var content: AnyView

  public var body: some View {
    VStack {
      content.maxFrame()
    }
  }
}

extension TableContent {
  public init<E: Hashable, V: View>(
    _ data: [E],
    @ViewBuilder content: @escaping (E
    ) -> V
  ) {
    let wrapper =
      Wrapper(data, id: \.self) { element in
        guard
          let element = element.base as? E else {
          return TableRow()
        }
        return TableRow(content(element))
      }
    self.init(data: data, wrapper)
  }

  init<V: View, Value>(
    data: [Value],
    @ViewBuilder content: @escaping (Value) -> V
  ) where Value: Hashable {
    let wrapper =
      Wrapper(data, id: \.self) { element in
        guard
          let element = element.base as? Value else {
          return TableRow()
        }
        return TableRow(content(element))
      }
    self.init(data: data, wrapper)
  }

  init(data: Data, _ wrapper: Wrapper) {
    self.wrapper = wrapper
    self.data = data
    content = AnyView(wrapper)
  }

  init<V: View>(data: Data, wrapper: Wrapper, erasing view: V) {
    self.wrapper = wrapper
    self.data = data
    content = AnyView(view)
  }
}
