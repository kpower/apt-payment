// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData
import SwiftUI
import os

@main
struct AptPaymentApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        ReceiptView()
          .modelContainer(.make(logger: Logger.make(category: "Model")))
      }
    }
    #if os(macOS)
      .defaultSize(width: 500, height: 300)
      .commands {
        SidebarCommands()
      }
    #endif
  }
}
