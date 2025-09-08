// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

#if DEBUG

import Foundation
import SwiftData

extension ModelContainer {
  @MainActor
  func fillSampleData() -> Self {
    LocationRegion.allSampleData.forEach(mainContext.insert(_:))
    Receipt.allSampleData.forEach(mainContext.insert(_:))
    
    return self
  }
}

// MARK: - LocationRegion

@MainActor
extension LocationRegion {
  static let sampleRegion0 = LocationRegion(title: "Location Region 0")
  static let sampleRegion1 = LocationRegion(title: "Location Region 1")
  
  fileprivate static let allSampleData = [ sampleRegion0, sampleRegion1 ]
}

// MARK: - Receipt

@MainActor
extension Receipt {
  static let sampleReceipt0 = Receipt(title: "Receipt 0", location: .sampleRegion0)
  static let sampleReceipt1 = Receipt(title: "Receipt 1", location: .sampleRegion0)
  static let sampleReceipt2 = Receipt(title: "Receipt 2", location: .sampleRegion1)
  
  fileprivate static let allSampleData = [ sampleReceipt0, sampleReceipt1, sampleReceipt2 ]
}

#endif
