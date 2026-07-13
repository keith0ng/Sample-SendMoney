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
    VStack(alignment: .leading) {
      Text("Amount: \(viewModel.transaction.amount)")
        .frame(maxWidth: .infinity,
               alignment: .leading)
      
      Text("Date: \(viewModel.transaction.date)")
        .frame(maxWidth: .infinity,
               alignment: .leading)
      
      Text("Recepient: \(viewModel.transaction.recepient)")
        .frame(maxWidth: .infinity,
               alignment: .leading)
    }
  }
}

#Preview {
  TransactionListItemView(viewModel: TransactionListItemView.ViewModel(transaction: Transaction.example))
}
