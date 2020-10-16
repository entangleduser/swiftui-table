//
//  File.swift
//  
//
//  Created by neutralradiance on 10/12/20.
//

import SwiftUI

public struct DefaultTableContenStyle: TableContenStyle {
    private let showsLine: Bool

    public func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 11.5) {
            Divider()
                .padding(.leading, 16)
                .visibility(showsLine)
            content
        }
        .background(Color(backgroundColor))
    }

    public init(showsLine: Bool = true) {
        self.showsLine = showsLine
    }
}
