// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
@preconcurrency import SwiftData

enum VersionedShemas {
  struct Live: VersionedSchema {
    static let versionIdentifier = Schema.Version(1, 0, 0)

    static let models: [any PersistentModel.Type] = [ LocationRegion.self ]
    static let schema = Schema(models)
  }
}
