//
//  TransactionHistoryView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct TransactionHistoryView: View {
    var body: some View {
      List {
        TransactionListItemView()
        TransactionListItemView()
        TransactionListItemView()
      }
      .listStyle(.plain)
    }
}

#Preview {
    TransactionHistoryView()
}
