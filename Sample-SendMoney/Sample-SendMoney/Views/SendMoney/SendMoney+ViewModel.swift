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
    
    @AppStorage(Constants.userBalanceKey) var userBalance: Double = Constants.defaultUserBalance
    @AppStorage(Constants.loggedinUserKey) var loggedInUser: String = Constants.defaultUsername
    
    private let networkManager = NetworkManager(baseURL: Constants.apiUrl)
    
    private var transaction: Transaction?
    
    var shouldShowSendMoneyFieldError: Bool {
      return didAttemptToSendMoney && (amountToSend <= 0 || amountToSend > userBalance)
    }
    
    var isSendMoneyValid: Bool {
      return (amountToSend > 0) && (amountToSend <= userBalance)
    }
    
    @MainActor func sendMoney(amount: Double) async throws {
      defer {
        isLoading = false
        shouldShowTransactionResultSheet = true
      }
      
      isLoading = true
      
      // This is only for the purpose of simulating a POST request
      // when a user is attempting to send a money via the app.
      // In the future, actual send money endpoint should be implemented here.
      let mockTransaction = MockTransaction(id: 999,
                                            title: "Sample-SendMoney",
                                            body: "This is a sample transaction",
                                            userId: loggedInUser)
      do {
        let _: MockTransaction = try await networkManager.post(endpoint: "/posts",
                                                               body: mockTransaction)
        userBalance -= amountToSend
      } catch {
        self.error = error
      }
    }
  }
}
