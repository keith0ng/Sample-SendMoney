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
      
      Image(systemName: "lock.circle")
        .foregroundStyle(.green)
        .fontWeight(.medium)
        .font(.largeTitle)
        .bold()
      
      VStack {
        TextField(String(localized: "username"),
                  text: $viewModel.username).textFieldStyle(RoundedBorderTextFieldStyle())
        if viewModel.shouldShowUsernameError {
          Text(String(localized: "usernameEmptyError")).frame(maxWidth: .infinity,
                                                 alignment: .leading)
          .foregroundStyle(.red)
        }
      }
      
      VStack {
        SecureField(String(localized: "password"),
                    text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
        if viewModel.shouldShowPasswordError {
          Text(String(localized: "passwordEmptyError")).frame(maxWidth: .infinity,
                                                 alignment: .leading)
          .foregroundStyle(.red)
        }
      }
      
      VStack {
        ZStack {
          HorizontalButton(title: String(localized: "login"),
                           background: viewModel.isLoading ? Color.gray :
                                                             Color.green,
                           disabled: viewModel.isLoading,
                           action: {
            
            viewModel.didAttemptToLogin = true
            if(viewModel.isLoginValid) {
              viewModel.isLoading = true
              Task {
                try await viewModel.loginUser()
              }
            }
            
          })
          
          if viewModel.isLoading {
            ProgressView()
              .progressViewStyle(.circular).tint(.white)
          }
        }
        
        
        if viewModel.error != nil {
          Text(String(localized: "loginError")).frame(maxWidth: .infinity,
                                                     alignment: .leading)
          .foregroundStyle(.red)
        }
      }
    }
    .padding(.horizontal, 16.0)
  }
}

#Preview {
  LoginView()
}
