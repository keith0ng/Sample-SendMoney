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
          TextField("0.00",
                    value: $viewModel.amountToSend,
                    format: .currency(code: "PHP")
            .precision(.fractionLength(2)))
        }.font(.title)
          .bold()
        if viewModel.shouldShowSendMoneyFieldError {
          Text("Send a proper amount").frame(maxWidth: .infinity,
                                             alignment: .leading)
          .foregroundStyle(.red)
        }
      }
      ZStack {
        if viewModel.isLoading {
          ProgressView()
            .progressViewStyle(.circular)
        }
        Button("Send") {
          viewModel.didAttemptToSendMoney = true
          if(viewModel.isSendMoneyValid) {
            viewModel.didAttemptToSendMoney = false
            Task {
              try await viewModel.sendMoney(amount: viewModel.amountToSend)
            }
          }
        }.frame(maxWidth: .infinity)
          .padding(8.0)
          .background(viewModel.isLoading ? Color.gray.opacity(0.25) : Color.green.opacity(0.25))
          .foregroundStyle(.black)
          .clipShape(.buttonBorder)
          .disabled(viewModel.isLoading)
      }
    }
    .padding(.horizontal, 16.0)
    .sheet(isPresented: $viewModel.shouldShowTransactionResultSheet,
           onDismiss: {
      if viewModel.error == nil {
        viewModel.amountToSend = 0.0
      }
    }) {
      let sendMoneyResultSheetViewModel = SendMoneyResultSheet.ViewModel(
        sentAmount: viewModel.amountToSend,
        error: viewModel.error)
      SendMoneyResultSheet(viewModel: sendMoneyResultSheetViewModel).presentationDetents([.medium])
    }
  }
}

#Preview {
  SendMoneyView()
}
