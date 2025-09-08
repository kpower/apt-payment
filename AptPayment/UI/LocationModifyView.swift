// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData
import SwiftUI

struct LocationModifyView: View {
  init(editLocation: LocationRegion? = nil) {
    _model = StateObject(
      wrappedValue: LocationModifyViewModel(editLocation: editLocation)
    )
  }
  
  var body: some View {
    Form {
      TextField("location-modify.field.title", text: $model.title)
        .textFieldStyle(.roundedBorder)
        .padding()
    }
    .padding()
    .navigationBarBackButtonHidden()
    .navigationTitle(
      model.edit
        ? "location-modify.nav.title-add"
        : "location-modify.nav.title-edit"
    )
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("location-modify.cancel", action: dismiss.callAsFunction)
      }
      if model.edit {
        ToolbarItem(placement: .secondaryAction) {
          Button("location-modify.reset", action: model.reset)
        }
      }
      ToolbarItem(placement: .primaryAction) {
        Button("location-modify.save") {
          if model.saveLocationRegion(context: context) {
            dismiss()
          }
        }
        .disabled(!model.saveAllowed)
      }
    }
    Spacer()
  }
  
  @StateObject private var model: LocationModifyViewModel
  
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
}

// MARK: -

#Preview("New") {
  makeModifyPreview {
    .makeSampleEmpty()
  }
}

#Preview("Edit") {
  makeModifyPreview(edit: true) {
    .makeSampleEmpty().fillSampleData()
  }
}

#if DEBUG

@MainActor
private func makeModifyPreview(
  edit: Bool = false,
  containerFactory: () -> ModelContainer
) -> some View {
  NavigationStack {
    LocationModifyView(editLocation: edit ? LocationRegion.sampleRegion0 : nil)
      .modelContainer(containerFactory())
  }
}

#endif
