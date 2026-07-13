//
//  BalanceView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct BalanceView: View {
  
  @ObservedObject var viewModel: ViewModel
  
  var body: some View {
    if viewModel.isLoading {
      Text("Balance: Loading... PHP")
    } else if viewModel.error != nil {
      Text("There's a problem showing your balance.")
    } else {
      
      HStack{
        Text("Balance: ")
        if viewModel.isBalanceExposed {
          Text(viewModel.balance,
               format: .currency(code: "PHP")
            .precision(.fractionLength(2))
          )
        } else {
          Text("₱*****")
        }
      }.font(.title).bold()
    }
  }
}

#Preview {
  BalanceView(viewModel: BalanceView.ViewModel(balance: 1000.0, isBalanceExposed: false))
}
