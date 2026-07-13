//
//  TransactionHistoryView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct TransactionHistoryView: View {
  
  var viewModel = ViewModel()
  
  var body: some View {
    if viewModel.isLoading {
      ProgressView().progressViewStyle(.circular)
    } else if viewModel.error != nil {
      
    } else {
      List {
        ForEach(viewModel.transactions, id: \.id) { transaction in
          
          let transactionListItemViewModel = TransactionListItemView.ViewModel(
            transaction: transaction)
          
          TransactionListItemView(viewModel: transactionListItemViewModel)
        }
      }
    }
  }
}

#Preview {
  TransactionHistoryView()
}
