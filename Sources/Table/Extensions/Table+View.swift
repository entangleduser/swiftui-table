//
//  File.swift
//  
//
//  Created by neutralradiance on 10/9/20.
//

import SwiftUI

public extension View {
    func modify<V: View>(@ViewBuilder content: (Self) -> V) -> some View {
        content(self)
    }
    func maxFrame(alignment: Alignment = .topLeading) -> some View {
        self.modify { content in
            content
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity, alignment: alignment)
        }
    }
}
