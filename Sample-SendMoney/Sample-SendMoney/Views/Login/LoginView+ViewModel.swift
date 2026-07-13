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
    @Published var didSubmitForm = false
    @AppStorage("loggedInUser") var loggedInUser: String?
    
    var shouldShowUsernameError: Bool {
      return didSubmitForm && username.isEmpty
    }
    
    var shouldShowPasswordError: Bool {
      return didSubmitForm && password.isEmpty
    }
    
    var isLoginValid: Bool {
      return !username.isEmpty && !password.isEmpty
    }
    
    func loginUser() {
      guard isLoginValid else {
        return
      }
      KeychainManager.shared.username = username
      KeychainManager.shared.password = password
      loggedInUser = username
      
    }
  }
}
