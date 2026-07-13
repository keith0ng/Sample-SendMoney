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
      
      if viewModel.isLoading {
        //          ProgressView().progressViewStyle(.circular)
      } else if viewModel.error != nil {
        
      } else {
        Button("Login") {
          //            viewModel.isLoading = true
          viewModel.didSubmitForm = true
          if(viewModel.isLoginValid) {
            viewModel.loginUser()
            viewModel.didSubmitForm = false
          }
        }.frame(maxWidth: .infinity)
          .padding(8.0)
          .background(Color.green.opacity(0.25))
          .foregroundStyle(.black)
          .clipShape(.buttonBorder)
      }
    }
    .padding(.horizontal, 16.0)
  }
}

#Preview {
  LoginView()
}
