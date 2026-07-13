//
//  LoginView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
      VStack(alignment: .center, spacing: 16.0) {
        HStack {
          Text("Username:")
          TextField("Username", text: .constant(""))
        }
        
        HStack {
          Text("Password:")
          SecureField("Password", text: .constant(""))
        }
        
        Button("Login") {
          
        }
      }
      .padding(.horizontal, 16.0)
    }
}

#Preview {
    LoginView()
}
