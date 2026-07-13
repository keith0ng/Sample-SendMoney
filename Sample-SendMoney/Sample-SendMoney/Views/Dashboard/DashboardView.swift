//
//  DashboardView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct DashboardView: View {
  
  @ObservedObject var viewModel = ViewModel()
  
  var body: some View {
    NavigationStack(path: $viewModel.path) {
      
      VStack(alignment: .leading, spacing: 16.0) {
        
        let balance = viewModel.isBalanceExposed ? "\(viewModel.userBalance)" : "*****"
        
        Text("Balance: \(balance) PHP")
          .frame(maxWidth: .infinity, alignment: .leading)
        
        let balanceButtonText = viewModel.isBalanceExposed ? "Hide Balance" : "Show Balance"
        
        Button(balanceButtonText) {
          viewModel.isBalanceExposed.toggle()
        }
        
        Button("Send Money") {
          viewModel.path.append(NavigationPaths.sendMoney)
        }
        
        Button("Transaction History") {
          viewModel.path.append(NavigationPaths.transactionHistory)
        }
        
        Button("Logout") {
          if let loggedIn = viewModel.isLoggedIn, loggedIn {
            viewModel.isLoggedIn = false
          }
        }
      }
      .navigationDestination(for: NavigationPaths.self) { value in
        switch value {
        case .sendMoney:
          SendMoneyView()
        case .transactionHistory:
          TransactionHistoryView()
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
