//
//  TransactionHistory+ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

extension TransactionHistoryView {
  class ViewModel: ObservableObject {
    var transactions = [Transaction(id: UUID().uuidString,
                                    recepient: "Franklin",
                                    amount: 100.0,
                                    date: "July, 13, 2026"),
                        Transaction(id: UUID().uuidString,
                                    recepient: "Trevor Philipps",
                                    amount: 1000.0,
                                    date: "July, 13, 2026"),
                        Transaction.example]
  }
}
