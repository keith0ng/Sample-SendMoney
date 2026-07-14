//
//  ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

extension LoginView {
  class ViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var error: Error?
    @Published var username = ""
    @Published var password = ""
    @Published var didAttemptToLogin = false
    @AppStorage("loggedInUser") var loggedInUser: String = "user"
    
    private let networkManager = NetworkManager(baseURL: "https://jsonplaceholder.typicode.com")
    
    var shouldShowUsernameError: Bool {
      return didAttemptToLogin && username.isEmpty
    }
    
    var shouldShowPasswordError: Bool {
      return didAttemptToLogin && password.isEmpty
    }
    
    var isLoginValid: Bool {
      return !username.isEmpty && !password.isEmpty
    }
    
    @MainActor func loginUser() async throws {
      guard isLoginValid else {
        return
      }
      
      defer {
        isLoading = false
      }
      
      isLoading = true
      let mockTransaction = MockTransaction(id: 999,
                                            title: "Sample-SendMoney",
                                            body: "This is a sample transaction",
                                            userId: loggedInUser)
      do {
        let _: MockTransaction = try await networkManager.post(endpoint: "/posts",
                                                               body: mockTransaction)
        KeychainManager.shared.username = username
        KeychainManager.shared.password = password
        loggedInUser = username
      } catch {
        self.error = error
      }
    }
  }
}
