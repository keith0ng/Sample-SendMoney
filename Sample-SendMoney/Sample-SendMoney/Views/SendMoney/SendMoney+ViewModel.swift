//
//  ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation
import SwiftUI

extension SendMoneyView {
  class ViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var shouldShowTransactionResultSheet = false
    @Published var amountToSend: Double = 0
    @Published var didAttemptToSendMoney = false
    
    @AppStorage("userBalance") var userBalance: Double = 1000.0
    
    private var transaction: Transaction?
    
    var shouldShowSendMoneyFieldError: Bool {
      return didAttemptToSendMoney && (amountToSend <= 0 || amountToSend > userBalance)
    }
    
    var isSendMoneyValid: Bool {
      return (amountToSend > 0) && (amountToSend <= userBalance)
    }
    
    func constructTransaction() {
      
    }
  }
}
