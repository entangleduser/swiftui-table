//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public protocol ContentStyle {
    typealias Content = TableContent.Data
    associatedtype ModifiedContent: View
    func body(content: Content) -> ModifiedContent
}

public extension TableContent.Data {
    func contentStyle<Style>(_ style: Style) -> some View where Style: ContentStyle {
        style.body(content: self)
    }
}
