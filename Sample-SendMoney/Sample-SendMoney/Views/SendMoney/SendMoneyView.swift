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
      // MARK: -- Send Money input field
      VStack {
        VStack {
          Text("\(String(localized: "amount")):")
            .font(.headline)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
          TextField("",
                    value: $viewModel.amountToSend,
                    format: .currency(code: Constants.defaultCurrency)
            .precision(.fractionLength(2)))
          .keyboardType(.decimalPad)
          .font(.title)
          .bold()
        }
        if viewModel.shouldShowSendMoneyFieldError {
          Text(String(localized: "enterValidAmountError")).frame(maxWidth: .infinity,
                                                                 alignment: .leading)
          .foregroundStyle(.red)
        }
      }
      // MARK: -- Send button
      ZStack {
        HorizontalButton(title: String(localized: "send"),
                         background: viewModel.isLoading ? Color.gray.opacity(0.75) :
                          Color.green,
                         disabled: viewModel.isLoading,
                         action: {
          
          viewModel.didAttemptToSendMoney = true
          
          if(viewModel.isSendMoneyValid) {
            viewModel.didAttemptToSendMoney = false
            Task {
              try await viewModel.sendMoney(amount: viewModel.amountToSend)
            }
          }
          
        })
        
        if viewModel.isLoading {
          ProgressView()
            .progressViewStyle(.circular)
        }
      }
    }
    .padding(.horizontal, 16.0)
    // MARK: -- Result Sheet
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
