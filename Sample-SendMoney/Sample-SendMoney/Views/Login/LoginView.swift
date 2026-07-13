//
//  LoginView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct LoginView: View {
  
  @ObservedObject private var viewModel = ViewModel()
  
    var body: some View {
      VStack(alignment: .center, spacing: 16.0) {
        VStack {
          HStack {
            Text("Username:")
            TextField("Username", text: $viewModel.username)
          }
          if viewModel.shouldShowUsernameError {
            Text("Username cannot be empty").frame(maxWidth: .infinity, alignment: .leading)
          }
        }
        
        VStack {
          HStack {
            Text("Password:")
            SecureField("Password", text: $viewModel.password)
          }
          if viewModel.shouldShowPasswordError {
            Text("Password cannot be empty").frame(maxWidth: .infinity, alignment: .leading)
          }
        }
        
        Button("Login") {
          viewModel.didSubmitForm = true
          if(viewModel.isLoginValid) {
            viewModel.loginUser()
            viewModel.didSubmitForm = false
          }
        }
      }
      .padding(.horizontal, 16.0)
    }
}

#Preview {
    LoginView()
}
