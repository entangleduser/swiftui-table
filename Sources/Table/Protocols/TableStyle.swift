//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public protocol TableStyle {
  typealias Body = AnyTable
  typealias Content = TableContent.Wrapper
  typealias Row = TableRow
  associatedtype ModifiedBody: View
  associatedtype ModifiedContent: View
  associatedtype ModifiedRow: View
  func body(content: Body) -> ModifiedBody
  func content(content: Content) -> ModifiedContent
  func row(content: Row) -> ModifiedRow
}

public extension ListView {
  func tableStyle<S>(_ style: S) -> some View
    where S: TableStyle {
    let wrapper =
      TableContent
        .Wrapper(content.data, id: \.self) { element in
          TableRow(
            style.row(
              content: content.wrapper.content(element)
            )
          )
        }

    let erased = style.content(content: wrapper)
    return style.body(
      content: AnyTable(
        self,
        TableContent(
          data: content.data,
          wrapper: wrapper,
          erasing: erased
        )
      )
    )
  }
}
