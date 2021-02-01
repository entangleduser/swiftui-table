//
//  File.swift
//
//
//  Created by neutralradiance on 10/16/20.
//

import SwiftUI

public struct PullContent: View {
  let content: AnyView
  public var body: some View {
    content.maxFrame()
  }
}

extension PullContent {
  init<V: View>(_ content: V) {
    self.content = AnyView(content)
  }

  public struct Overlay: View {
    let content: AnyView
    public var body: some View {
      content
    }
  }
}

extension PullContent.Overlay {
  init<V: View>(_ view: V) {
    content = AnyView(view)
  }
}
