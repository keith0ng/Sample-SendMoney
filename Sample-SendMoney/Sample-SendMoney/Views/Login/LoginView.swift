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
      // MARK: -- Header Icon
      Image(systemName: "lock.circle")
        .foregroundStyle(.green)
        .fontWeight(.medium)
        .font(.largeTitle)
        .bold()
      
      // MARK: -- Fields
      RoundedRectangleField(text: $viewModel.username,
                            placeholder: String(localized: "username"),
                            errorText: viewModel.shouldShowUsernameError ?
                            String(localized: "usernameEmptyError") : nil)
      
      RoundedRectangleField(text: $viewModel.username,
                            placeholder: String(localized: "password"),
                            isSecureField: true,
                            errorText: viewModel.shouldShowUsernameError ?
                            String(localized: "passwordEmptyError") : nil)
      
      // MARK: -- Login Button
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
                                                      alignment: .center)
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
