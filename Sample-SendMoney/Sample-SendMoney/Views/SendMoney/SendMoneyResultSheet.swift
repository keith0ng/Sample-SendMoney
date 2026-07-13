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
        if viewModel.error != nil {
          Image(systemName: "x.circle")
            .foregroundStyle(.red)
            .fontWeight(.medium)
            .font(.title)
          Text("Sending failed.").font(.title).bold()
          HStack {
            Text("You are refunded").font(.headline).bold()
          }
        } else {
          Image(systemName: "checkmark.circle")
            .foregroundStyle(.green)
            .fontWeight(.medium)
            .font(.title)
            .bold()
          Text("Success!").font(.title).bold()
          HStack {
            Text(viewModel.sentAmount,
                 format: .currency(code: "PHP")
              .precision(.fractionLength(2))).font(.title).bold()
            Text("was sent!").font(.title).bold()
          }
        }
      }
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
