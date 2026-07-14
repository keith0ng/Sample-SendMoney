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
      HStack {
        Text("\(String(localized: "balance")): ").font(.title).bold()
        ProgressView().progressViewStyle(.circular)
      }
    } else if viewModel.error != nil {
      Text(String(localized: "balanceDisplayError")).font(.subheadline).bold()
    } else {
      
      HStack{
        Text("\(String(localized: "balance")): ")
        if viewModel.isBalanceExposed {
          Text(viewModel.balance,
               format: .currency(code: Constants.defaultCurrency)
            .precision(.fractionLength(2))
          )
        } else {
          Text(String(localized: "balanceMask"))
        }
      }.font(.title).bold()
    }
  }
}

#Preview {
  BalanceView(viewModel: BalanceView.ViewModel(balance: Constants.defaultUserBalance,
                                               isBalanceExposed: false))
}
