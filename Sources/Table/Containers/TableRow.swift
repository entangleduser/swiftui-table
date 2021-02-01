//
//  File.swift
//
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct TableRow: View {
  private var content = AnyView(EmptyView())
  public var body: some View {
    content
      .padding(.bottom, 8)
      .padding(.top, 0)
      .foregroundColor(.primary)
  }
}

public extension TableRow {
  init<V: View>(_ view: V) {
    content = AnyView(view)
  }

  init<V: View>(@ViewBuilder content: () -> V) {
    self.init(content())
  }
}
