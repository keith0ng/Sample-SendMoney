//
//  DashboardView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct DashboardView: View {
  @State var path = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $path) {
      
      VStack(alignment: .leading, spacing: 16.0) {
        
        Text("Balance: 1000.00 PHP")
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Button("Send Money") {
          path.append("sendMoney")
        }
        
        Button("Transaction History") {
          path.append("transactionHistory")
        }
        
        Button("Logout") {
          
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
