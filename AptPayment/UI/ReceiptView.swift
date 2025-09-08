// Copyright © 2025 PrankMind (Andrey Yakushev). All rights reserved.

import Foundation
import SwiftData
import SwiftUI

struct ReceiptView: View {
  var body: some View {
    LazyVStack {
      ForEach(receipts) { receipt in
        NavigationLink {
          ReceiptModifyView(editReceipt: receipt)
            .modelContext(context)
        } label: {
          HStack {
            Text(receipt.title)
          }.padding()
        }
      }
    }
    .padding()
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        NavigationLink {
          ReceiptModifyView()
            .modelContext(context)
        } label: {
          Label("receipts.add.title", systemImage: "plus")
        }
      }
    }
    .navigationTitle("receipts.nav.title")
  }
  
  @Query<Receipt>(
    sort: [ SortDescriptor(\.title) ]
  )
  private var receipts: [Receipt] = []
  
  @Environment(\.modelContext) var context
}

#Preview {
  NavigationStack {
    ReceiptView()
      .modelContainer(.makeSampleEmpty().fillSampleData())
  }
}
