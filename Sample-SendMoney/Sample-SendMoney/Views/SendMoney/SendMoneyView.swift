//
//  SendMoneyView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct SendMoneyView: View {
  
  @ObservedObject var viewModel = ViewModel()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16.0) {
      VStack {
        HStack {
          Text("Amount:")
          TextField("0.00", value: $viewModel.amountToSend, format: .currency(code: "PHP").precision(.fractionLength(2)))
        }.font(.title).bold()
        if viewModel.shouldShowSendMoneyFieldError {
          Text("Send a proper amount").frame(maxWidth: .infinity, alignment: .leading).foregroundStyle(.red)
        }
      }
      if viewModel.isLoading {
          
      } else if viewModel.error != nil {
        
      } else {
        Button("Send") {
          viewModel.didAttemptToSendMoney = true
          if(viewModel.isSendMoneyValid) {
            viewModel.userBalance -= viewModel.amountToSend
            viewModel.shouldShowTransactionResultSheet = true
          }
        }.frame(maxWidth: .infinity)
          .padding(8.0)
          .background(Color.green.opacity(0.25))
          .foregroundStyle(.black)
          .clipShape(.buttonBorder)
      }
    }
    .padding(.horizontal, 16.0)
    .sheet(isPresented: $viewModel.shouldShowTransactionResultSheet) {
      SendMoneyTransactionResultSheet()
        .presentationDetents([.large])
    }
  }
}

#Preview {
  SendMoneyView()
}
