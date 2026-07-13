//
//  DashboardView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct DashboardView: View {
  @State private var path = NavigationPath()
  @State private var isBalanceExposed: Bool = true
  @AppStorage("isLoggedIn") private var isLoggedIn: Bool?
  
  private let userBalance: Double = 1000.0
  
  var body: some View {
    NavigationStack(path: $path) {
      
      VStack(alignment: .leading, spacing: 16.0) {
        
        let balance = isBalanceExposed ? "\(userBalance)" : "*****"
        
        Text("Balance: \(balance) PHP")
          .frame(maxWidth: .infinity, alignment: .leading)
        
        let balanceButtonText = isBalanceExposed ? "Hide Balance" : "Show Balance"
        
        Button(balanceButtonText) {
          isBalanceExposed.toggle()
        }
        
        Button("Send Money") {
          path.append("sendMoney")
        }
        
        Button("Transaction History") {
          path.append("transactionHistory")
        }
        
        Button("Logout") {
          if let loggedIn = isLoggedIn, loggedIn {
            isLoggedIn = false
          }
        }
      }
      .navigationDestination(for: String.self) { value in
        switch value {
        case "sendMoney":
          SendMoneyView()
        case "transactionHistory":
          TransactionHistoryView()
        default:
          DashboardView() // Replace with proper default destination
        }
      }
      .frame(maxWidth: .infinity)
      .padding(.horizontal, 16.0)
    }
  }
}

#Preview {
    DashboardView()
}
