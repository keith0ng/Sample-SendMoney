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
          if viewModel.isLoading {
            ProgressView()
              .progressViewStyle(.circular)
          }
          Button("Login") {
            viewModel.isLoading = true
            viewModel.didAttemptToLogin = true
            if(viewModel.isLoginValid) {
              viewModel.didAttemptToLogin = false
              Task {
                try await viewModel.loginUser()
              }
            }
          }.frame(maxWidth: .infinity)
            .padding(8.0)
            .background(viewModel.isLoading ? Color.gray.opacity(0.25) : Color.green.opacity(0.25))
            .foregroundStyle(.black)
            .clipShape(.buttonBorder)
            .disabled(viewModel.isLoading)
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
