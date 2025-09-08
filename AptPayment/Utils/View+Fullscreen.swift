// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftUI

extension View {
  /// sheet on macOS, fullscreen cover otherwise
  nonisolated func crossFullScreenCover<Item, Content>(
    item: Binding<Item?>,
    onDismiss: (() -> Void)? = nil,
    @ViewBuilder content: @escaping (Item) -> Content
  ) -> some View where Item : Identifiable, Content : View {
    #if os(macOS)
    sheet(item: item, onDismiss: onDismiss, content: content)
    #else
    fullScreenCover(item: item, onDismiss: onDismiss, content: content)
    #endif
  }
  
  /// sheet on macOS, fullscreen cover otherwise
  nonisolated func crossFullScreenCover<Content>(
    isPresented: Binding<Bool>,
    onDismiss: (() -> Void)? = nil,
    @ViewBuilder content: @escaping () -> Content
  ) -> some View where Content : View {
    #if os(macOS)
    sheet(isPresented: isPresented, onDismiss: onDismiss, content: content)
    #else
    fullScreenCover(isPresented: isPresented, onDismiss: onDismiss, content: content)
    #endif
  }
}
