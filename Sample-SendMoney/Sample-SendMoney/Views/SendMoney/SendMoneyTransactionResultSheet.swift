//
//  SendMoneyTransactionSheet.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct SendMoneyTransactionResultSheet: View {
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    NavigationView {
      VStack {
        Text("Success!")
        Text("100.0 PHP")
        Text("Money sent successfully!")
      }
      .toolbar(content: {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundStyle(.gray)
              .symbolVariant(.circle.fill)
          }
        }
      })
    }
  }
}

#Preview {
    SendMoneyTransactionResultSheet()
}
