// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Combine
import Foundation
import SwiftData

final class ReceiptModifyViewModel: ObservableObject {
  var edit: Bool { editReceipt != nil }
  var saveAllowed: Bool { locationWhenSaveAllowed != nil }
  
  @Published var location: LocationRegion?
  @Published var title = ""
  
  init(editReceipt: Receipt?) {
    self.editReceipt = editReceipt
    reset()
  }
  
  func reset() {
    location = editReceipt?.location
    title = editReceipt?.title ?? ""
  }
  
  func saveReceipt(context: ModelContext) -> Bool {
    guard let location = locationWhenSaveAllowed else { return false }
    
    if let editReceipt {
      editReceipt.location = location
      editReceipt.title = title
    } else {
      let receipt = Receipt(title: title, location: location)
      context.insert(receipt)
    }
    return true
  }
 
  private var locationWhenSaveAllowed: LocationRegion? {
    title.isEmpty ? nil : location
  }
  
  private let editReceipt: Receipt?
}
