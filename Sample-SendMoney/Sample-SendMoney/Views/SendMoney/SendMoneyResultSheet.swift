//
//  SendMoneyTransactionSheet.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct SendMoneyResultSheet: View {
  @Environment(\.dismiss) private var dismiss
  
  var viewModel: ViewModel
  
  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        // MARK: -- Error state
        if viewModel.error != nil {
          Image(systemName: "x.circle")
            .foregroundStyle(.red)
            .fontWeight(.medium)
            .font(.title)
          Text(String(localized: "sendFailPrompt")).font(.title).bold()
          HStack {
            Text(String(localized: "refundedPrompt")).font(.headline).bold()
          }
        } else {
          // MARK: -- Success state
          Image(systemName: "checkmark.circle")
            .foregroundStyle(.green)
            .fontWeight(.medium)
            .font(.title)
            .bold()
          Text("\(String(localized: "success"))!").font(.title).bold()
          HStack {
            Text(viewModel.sentAmount,
                 format: .currency(code: Constants.defaultCurrency)
              .precision(.fractionLength(2))).font(.title).bold()
            Text("\(String(localized: "wasSent"))!").font(.title).bold()
          }
        }
      }
      // MARK: -- Dismiss button
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundStyle(.gray)
          }
        }
      }
    }
  }
}


#Preview {
  SendMoneyResultSheet(viewModel: SendMoneyResultSheet.ViewModel(sentAmount: 100.0, error: nil))
}
