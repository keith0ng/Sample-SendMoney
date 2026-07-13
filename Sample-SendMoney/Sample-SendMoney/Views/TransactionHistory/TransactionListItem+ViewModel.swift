//
//  TransactionListItem+ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

extension TransactionListItemView {
  class ViewModel: ObservableObject {
    let transaction: Transaction
    
    init(transaction: Transaction) {
      self.transaction = transaction
    }
  }
}
