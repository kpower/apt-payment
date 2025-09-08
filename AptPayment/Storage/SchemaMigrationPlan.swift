// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
@preconcurrency import SwiftData

struct SchemaMigrationPlanImpl: SchemaMigrationPlan {
  static let schemas: [any VersionedSchema.Type] = [ VersionedShemas.Live.self ]
  static let stages: [MigrationStage] = []
}
