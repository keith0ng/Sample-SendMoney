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
      HStack {
        Text("Amount:").font(.headline).bold()
        Text(viewModel.transaction.amount,
             format: .currency(code: "PHP")
                      .precision(.fractionLength(2)))
      }
      
      HStack {
        Text("Recepient:").font(.headline).bold()
        Text(viewModel.transaction.recepient)
      }
      
      HStack {
        Text("Date:").font(.headline).bold()
        Text(viewModel.transaction.date)
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
