//
//  SendMoneyView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct SendMoneyView: View {
    var body: some View {
      VStack(alignment: .leading, spacing: 16.0) {
        HStack {
          Text("Amount:")
          TextField("0.00", text: .constant(""))
        }
        Button("Send") {
          
        }
      }.padding(.horizontal, 16.0)
    }
}

#Preview {
    SendMoneyView()
}
