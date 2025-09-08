// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData

@Model
final class Tariff {
  var startDate: Date
  var value: Money

  @Relationship(deleteRule: .nullify, inverse: \UtilityServiceItem.tariffs)
  var item: UtilityServiceItem
  
  init(value: Money, startDate: Date, item: UtilityServiceItem) {
    self.value = value
    self.startDate = startDate
    self.item = item
  }
}
