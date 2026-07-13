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
          TextField("0.00", value: $viewModel.amountToSend, format: .number)
        }
        if viewModel.shouldShowSendMoneyFieldError {
          Text("Send a proper amount").frame(maxWidth: .infinity, alignment: .leading)
        }
      }
      Button("Send") {
        viewModel.didAttemptToSendMoney = true
        if(viewModel.isSendMoneyValid) {
          viewModel.shouldShowTransactionResultSheet = true
        }
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
