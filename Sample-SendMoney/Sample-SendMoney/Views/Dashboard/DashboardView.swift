//
//  DashboardView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct DashboardView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 16.0) {
      
      Text("Balance: 1000.00 PHP")
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Button("Send Money") {
        
      }
      
      Button("Transaction History") {
        
      }
      
      Button("Logout") {
        
      }
    }
    .frame(maxWidth: .infinity)
    .padding(.horizontal, 16.0)
  }
}

#Preview {
    DashboardView()
}
