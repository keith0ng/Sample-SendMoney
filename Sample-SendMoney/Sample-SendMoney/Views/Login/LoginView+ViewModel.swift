//
//  ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

extension LoginView {
  class ViewModel: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool?
    @Published var username = ""
    @Published var password = ""
    @Published var didSubmitForm = false
    
    var shouldShowUsernameError: Bool {
      return didSubmitForm && username.isEmpty
    }
    
    var shouldShowPasswordError: Bool {
      return didSubmitForm && password.isEmpty
    }
    
    var isLoginValid: Bool {
      return !username.isEmpty && !password.isEmpty
    }
  }
}
