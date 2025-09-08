// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData

@Model
final class UtilityServiceItem {
  var title: String
  
  @Relationship(deleteRule: .nullify, inverse: \LocationRegion.items)
  var location: LocationRegion
  
  @Relationship(deleteRule: .nullify)
  var receipts: [Receipt]
  
  @Relationship(deleteRule: .cascade)
  var tariffs: [Tariff]
  
  init(title: String, location: LocationRegion, receipts: [Receipt] = [], tariffs: [Tariff] = []) {
    self.title = title
    self.location = location
    self.receipts = receipts
    self.tariffs = tariffs
  }
}
