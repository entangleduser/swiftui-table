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
    func maxFrame(align: Alignment = .topLeading) -> some View {
        self.modify { content in
            content
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity, alignment: align)
        }
    }
    func constrainWidth(_ value: CGFloat, align: Alignment = .leading) -> some View {
        self.modify { content in
            content
                //.frame(maxWidth: value, alignment: align)
                .frame(minWidth: value, alignment: align)
        }
    }
    func constrainHeight(_ value: CGFloat, align: Alignment = .center) -> some View {
        self.modify { content in
            content
                //.frame(maxHeight: value, alignment: align)
                .frame(minHeight: value, alignment: align)
        }
    }
    func padding(x: CGFloat = 11.5, y: CGFloat = 11.5) -> some View {
        self.modify { content in
                    content
                        .padding([.leading, .trailing], x)
                        .padding([.top, .bottom], y)
        }
    }
}
