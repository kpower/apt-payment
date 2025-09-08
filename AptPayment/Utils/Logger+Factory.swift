// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import os

extension Logger {
  static func make(category: StaticString) -> Self {
    Self(subsystem: Bundle.main.bundleIdentifier ?? "AptPaymentApp", category: category.description)
  }
}
