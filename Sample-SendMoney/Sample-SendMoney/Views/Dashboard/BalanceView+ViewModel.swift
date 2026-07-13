//
//  BalanceView+ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

extension BalanceView {
  class ViewModel: ObservableObject {
    @Published var isBalanceExposed: Bool
    @Published var balance: Double
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    init(balance: Double, isBalanceExposed: Bool) {
      self.isBalanceExposed = isBalanceExposed
      self.balance = balance
    }
  }
}
