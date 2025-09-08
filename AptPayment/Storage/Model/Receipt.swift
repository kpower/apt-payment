// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData

@Model
final class Receipt {
  #Unique<Receipt>([ \.title ])
  
  var title: String
  
  @Relationship(deleteRule: .nullify, inverse: \UtilityServiceItem.receipts)
  var items: [UtilityServiceItem]
  
  @Relationship(deleteRule: .nullify, inverse: \LocationRegion.receipts)
  var location: LocationRegion
  
  init(title: String, items: [UtilityServiceItem] = [], location: LocationRegion) {
    self.title = title
    self.items = items
    self.location = location
  }
}
