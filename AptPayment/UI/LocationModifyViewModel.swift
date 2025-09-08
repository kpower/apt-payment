// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Combine
import Foundation
import SwiftData

final class LocationModifyViewModel: ObservableObject {
  var edit: Bool { editLocation != nil }
  var saveAllowed: Bool { !title.isEmpty }
  
  @Published var title = ""
  
  init(editLocation: LocationRegion? = nil) {
    self.editLocation = editLocation
    reset()
  }
  
  func reset() {
    title = editLocation?.title ?? ""
  }
  
  func saveLocationRegion(context: ModelContext) -> Bool {
    guard saveAllowed else { return false }
    
    if let editLocation {
      editLocation.title = title
    } else {
      let location = LocationRegion(title: title)
      context.insert(location)
    }
    return true
  }
  
  private let editLocation: LocationRegion?
}
