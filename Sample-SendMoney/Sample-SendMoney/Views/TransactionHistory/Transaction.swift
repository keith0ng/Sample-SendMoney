//
//  TransactionHistory.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

struct Transaction: Hashable {
  let id: String
  let recepient: String
  let amount: Double
  let date: String
  
  static let example: Transaction = .init(
    id: UUID().uuidString,
    recepient: "Michael Townley",
    amount: 100.00,
    date: "2026-07-13"
  )
}
