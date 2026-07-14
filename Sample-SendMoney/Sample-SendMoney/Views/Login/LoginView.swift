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
        TextField("Username", text: $viewModel.username).textFieldStyle(RoundedBorderTextFieldStyle())
        if viewModel.shouldShowUsernameError {
          Text("Username cannot be empty").frame(maxWidth: .infinity,
                                                 alignment: .leading)
          .foregroundStyle(.red)
        }
      }
      
      VStack {
        SecureField("Password", text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
        if viewModel.shouldShowPasswordError {
          Text("Password cannot be empty").frame(maxWidth: .infinity,
                                                 alignment: .leading)
          .foregroundStyle(.red)
        }
      }
      
      VStack {
        ZStack {
          HorizontalButton(title: "Login",
                           background: viewModel.isLoading ? Color.gray :
                                                             Color.green,
                           disabled: viewModel.isLoading,
                           action: {
            
            viewModel.isLoading = true
            viewModel.didAttemptToLogin = true
            if(viewModel.isLoginValid) {
              viewModel.didAttemptToLogin = false
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
          Text("There's an error logging in.").frame(maxWidth: .infinity,
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
