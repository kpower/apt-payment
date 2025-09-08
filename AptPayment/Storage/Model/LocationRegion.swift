// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData

@Model
final class LocationRegion {
  var title: String
  
  @Relationship(deleteRule: .cascade)
  var items: [UtilityServiceItem]
  
  @Relationship(deleteRule: .cascade)
  var receipts: [Receipt]
  
  init(title: String, items: [UtilityServiceItem] = [], receipts: [Receipt] = []) {
    self.title = title
    self.items = items
    self.receipts = receipts
  }
}
