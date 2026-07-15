//
//  SendMoneyResult+ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

extension SendMoneyResultSheet {
  class ViewModel {
    var sentAmount: Double
    var error: Error?
    
    init(sentAmount: Double, error: Error?) {
      self.sentAmount = sentAmount
      self.error = error
    }
  }
}
