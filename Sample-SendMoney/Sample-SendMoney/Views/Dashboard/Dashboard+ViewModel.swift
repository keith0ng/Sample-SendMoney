//
//  Dashboard+ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation
import SwiftUI

extension DashboardView {
  class ViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    @Published var path = NavigationPath()
    @Published var isBalanceExposed: Bool = false
    @AppStorage("userBalance") var userBalance: Double = 1000.0
    @AppStorage("loggedInUser") var loggedInUser: String?
    
    private let networkManager = NetworkManager(baseURL: "https://jsonplaceholder.typicode.com")
    
    func logoutUser() {
      KeychainManager.shared.password = nil
      KeychainManager.shared.username = nil
      loggedInUser = nil
    }
    
    @MainActor func fetchBalance() async {
      defer {
        isLoading = false
      }
      
      isLoading = true
      
      do {
        let _: [Transaction] = try await networkManager.get(endpoint: "/users")
        // Append a small amount to simulate update of value.
        userBalance += 5.0
      } catch (let error) {
        self.error = error
      }
    }
  }
}
