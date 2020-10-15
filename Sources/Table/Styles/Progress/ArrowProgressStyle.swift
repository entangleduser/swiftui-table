//
//  File.swift
//  
//
//  Created by neutralradiance on 10/14/20.
//

import SwiftUI

public struct ArrowProgressStyle: ProgressViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Group {
            switch configuration.fractionCompleted! {
            case 0..<1:
                Image(systemName: "arrow.down")
                    .resizable()
                    .foregroundColor(Color(secondaryLabelColor))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .rotationEffect(
                        Angle(degrees: 180*(configuration.fractionCompleted!))
                    )
            default:
                ProgressView(value: configuration.fractionCompleted!)
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
    public init() {}
}
