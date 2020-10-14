//
//  File.swift
//
//
//  Created by neutralradiance on 10/8/20.
//

import SwiftUI

public protocol RowStyle {
    typealias Content = TableRow
    associatedtype ModifiedRow: View
    func body(content: Content) -> ModifiedRow
}

public extension TableRow {
    func rowStyle<Style>(_ style: Style) -> some View where Style: RowStyle {
        style.body(content: self)
    }
}
