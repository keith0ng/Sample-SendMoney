//
//  TransactionHistory+ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

extension TransactionHistoryView {
  class ViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var error: Error?
    @Published var transactions: [Transaction] = []
    
    private let networkManager = NetworkManager(baseURL: "https://jsonplaceholder.typicode.com")
    
    @MainActor func fetchTransactions() async {
      defer {
        isLoading = false
      }
      
      isLoading = true
      
      do {
        let transactions: [Transaction] = try await networkManager.get(endpoint: "/users")
        self.transactions = transactions
      } catch (let error) {
        self.error = error
      }
    }
  }
}
