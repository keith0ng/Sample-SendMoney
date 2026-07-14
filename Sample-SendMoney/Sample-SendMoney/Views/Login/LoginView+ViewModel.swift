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
    @AppStorage(Constants.loggedinUserKey) var loggedInUser: String = Constants.defaultUsername
    
    private let networkManager = NetworkManager(baseURL: Constants.apiUrl)
    
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
      
      // This is only for the purpose of simulating a POST request
      // when a user is logging in the app.
      // In the future, actual login endpoint should be implemented here.
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
