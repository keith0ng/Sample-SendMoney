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
    
    var formattedDate: String? {
      if let date = try? Date(transaction.date, strategy: .iso8601) {
          return date.formatted(date: .abbreviated, time: .omitted)
      }
      return nil
    }
    
    init(transaction: Transaction) {
      self.transaction = transaction
    }
  }
}
