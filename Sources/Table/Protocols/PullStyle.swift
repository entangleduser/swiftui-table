//
//  File.swift
//
//
//  Created by neutralradiance on 10/16/20.
//

import SwiftUI

public protocol PullStyle {
  typealias Content = PullContent
  typealias Configuration = PullView.Config // (spacing: CGFloat, percent: CGFloat, isLoading: Bool)
  associatedtype ModifiedContent: View
  associatedtype Overlay: View
  func body(content: Content) -> ModifiedContent
  func makeOverlay(config: Configuration) -> Overlay
}

extension PullContent {}

public extension PullView {}
