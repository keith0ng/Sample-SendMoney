//
//  ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

extension SendMoneyView {
  class ViewModel: ObservableObject {
    @Published var shouldShowTransactionResultSheet = false
    @Published var amountToSend = 0.0
    @Published var didAttemptToSendMoney = false
    
    private var transaction: Transaction?
    
    var shouldShowSendMoneyFieldError: Bool {
      return didAttemptToSendMoney && (amountToSend <= 0) // Add validation on current balance too.
    }
    
    var isSendMoneyValid: Bool {
      return amountToSend > 0 // && amountToSend < currentBalance
    }
    
    func constructTransaction() {
      transaction = Transaction(id: UUID().uuidString,
                                recepient: "Test",
                                amount: amountToSend,
                                date: "July 13, 2026")
    }
  }
}
