//
//  LoginView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct LoginView: View {
  
  @AppStorage("isLoggedIn") private var isLoggedIn = false
  @State private var username = ""
  @State private var password = ""
  
    var body: some View {
      VStack(alignment: .center, spacing: 16.0) {
        HStack {
          Text("Username:")
          TextField("Username", text: $username)
        }
        
        HStack {
          Text("Password:")
          SecureField("Password", text: $password)
        }
        
        Button("Login") {
          if !username.isEmpty && !password.isEmpty {
            isLoggedIn = true
          }
        }
      }
      .padding(.horizontal, 16.0)
    }
}

#Preview {
    LoginView()
}
