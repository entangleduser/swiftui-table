//
//  File.swift
//  
//
//  Created by neutralradiance on 10/14/20.
//

import SwiftUI

struct PullOverlay: View {
    let feedback = UIImpactFeedbackGenerator(style: .rigid)
    let threshold: CGFloat
    let delay: DispatchTime

    @Binding var offset: CGFloat
    @Binding var isFinished: Bool

    let action: () -> Void

    @State var isLoading: Bool = false

    var body: some View {
        let threshold = -self.threshold
        let offset = self.offset.clamp(threshold, 0)
        let spacing = Double(offset/threshold)
        let percent = spacing.clamp(0, 1)
        return VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                ProgressView(value: isLoading ? 1 : percent)
                    .progressViewStyle(ArrowProgressStyle())
                    .maxFrame(align: .center)
            }
        }
        .async {
            if isFinished {
                isLoading = false
                isFinished = false
            } else if offset == threshold {

                guard !isLoading else { return }
                feedback.impactOccurred()
                isLoading = true

                DispatchQueue.global().asyncAfter(deadline: delay, qos: .userInitiated) {
                    action()
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .offset(y: -CGFloat(percent)*20)
        .opacity(percent)
        .animation(.interactiveSpring())
    }
}
