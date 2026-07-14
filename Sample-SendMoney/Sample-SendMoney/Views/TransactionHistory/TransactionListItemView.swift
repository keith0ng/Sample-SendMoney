//
//  TransactionListItemView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct TransactionListItemView: View {
  let viewModel: ViewModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      // MARK: -- Recepient details
      VStack(alignment: .leading) {
        Text("\(String(localized: "recepient")):").font(.headline).bold()
        Text(viewModel.transaction.name)
        Text("@\(viewModel.transaction.username)")
      }
      
      // MARK: -- Amount
      HStack {
        Text("\(String(localized: "amount")):").font(.headline).bold()
        Text(viewModel.transaction.amount,
             format: .currency(code: Constants.defaultCurrency)
                      .precision(.fractionLength(2)))
      }
      
      // MARK: -- Date
      HStack {
        Text("\(String(localized: "date")):").font(.headline).bold()
        Text(viewModel.formattedDate ?? viewModel.transaction.date)
      }
        
    }
    .frame(maxWidth: .infinity,
             alignment: .leading)
  }
}

#Preview {
  TransactionListItemView(viewModel: TransactionListItemView.ViewModel(
    transaction: Transaction.example)
  )
}
