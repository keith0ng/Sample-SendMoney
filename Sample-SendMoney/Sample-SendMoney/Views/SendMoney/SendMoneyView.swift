//
//  SendMoneyView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct SendMoneyView: View {
  
  @State private var shouldShowTransactionResultSheet = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16.0) {
      HStack {
        Text("Amount:")
        TextField("0.00", text: .constant(""))
      }
      Button("Send") {
        shouldShowTransactionResultSheet.toggle()
      }
    }
    .padding(.horizontal, 16.0)
    .sheet(isPresented: $shouldShowTransactionResultSheet,
           onDismiss:{
      // What happens on dismiss?
    }) {
      SendMoneyTransactionResultSheet()
        .presentationDetents([.large])
    }
  }
}

#Preview {
  SendMoneyView()
}
