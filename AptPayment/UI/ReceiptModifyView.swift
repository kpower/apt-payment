// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData
import SwiftUI

struct ReceiptModifyView: View {
  init(editReceipt: Receipt? = nil) {
    _model = StateObject(
      wrappedValue: ReceiptModifyViewModel(editReceipt: editReceipt)
    )
  }
  
  var body: some View {
    Form {
      TextField("receipt-modify.field.title", text: $model.title)
        .textFieldStyle(.roundedBorder)
        .padding()
      
      Picker("receipt-modify.field.location", selection: $model.location) {
        Text("receipt-modify.field.location.unselected-option")
          .foregroundStyle(.secondary)
          .tag(nil as LocationRegion?)
        
        ForEach(locations) {
          Text($0.title).tag($0)
        }
      }
      
      NavigationLink {
        LocationModifyView()
          .modelContext(context)
      } label: {
        Label("receipt-modify.btn.location-add", systemImage: "plus")
      }.gridColumnAlignment(.leading)
    }
    .padding()
    .navigationBarBackButtonHidden()
    .navigationTitle(
      model.edit
        ? "receipt-modify.nav.title-add"
        : "receipt-modify.nav.title-edit"
    )
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("receipt-modify.cancel", action: dismiss.callAsFunction)
      }
      if model.edit {
        ToolbarItem(placement: .secondaryAction) {
          Button("receipt-modify.reset", action: model.reset)
        }
      }
      ToolbarItem(placement: .primaryAction) {
        Button("receipt-modify.save") {
          if model.saveReceipt(context: context) {
            dismiss()
          }
        }
        .disabled(!model.saveAllowed)
      }
    }
    Spacer()
  }
  
  @Query<LocationRegion>(
    sort: [ SortDescriptor(\.title) ]
  )
  private var locations: [LocationRegion]
  
  @StateObject private var model: ReceiptModifyViewModel
  
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
}

// MARK: -

#Preview("New Empty") {
  makeModifyPreview {
    .makeSampleEmpty()
  }
}

#Preview("New Filled") {
  makeModifyPreview {
    .makeSampleEmpty().fillSampleData()
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
    ReceiptModifyView(editReceipt: edit ? Receipt.sampleReceipt0 : nil)
      .modelContainer(containerFactory())
  }
}

#endif
