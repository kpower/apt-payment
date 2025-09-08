// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData
import os

extension ModelContainer {
  static func make(logger: Logger) -> ModelContainer {
    make(logger: logger, isStoredInMemoryOnly: false)
  }
  
  #if DEBUG
  @MainActor
  static func makeSampleEmpty() -> ModelContainer {
    make(logger: nil, isStoredInMemoryOnly: true)
  }
  #endif
  
  private static func make(logger: Logger?, isStoredInMemoryOnly: Bool) -> ModelContainer {
    let schema = VersionedShemas.Live.schema
    let cfg = ModelConfiguration(schema: schema, isStoredInMemoryOnly: isStoredInMemoryOnly)
    if let logger {
      logger.debug("Create model at \(cfg.url.path())")
    }
    
    do {
      return try ModelContainer(for: schema, configurations: [ cfg ])
    } catch {
      fatalError("Can't create model container. \(error)")
    }
  }
}
