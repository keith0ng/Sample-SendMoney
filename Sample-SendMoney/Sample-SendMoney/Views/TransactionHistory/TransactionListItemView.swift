//
//  TransactionListItemView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct TransactionListItemView: View {
    var body: some View {
      VStack(alignment: .leading) {
        Text("Amount: 1000.0")
          .frame(maxWidth: .infinity,
                 alignment: .leading)
        
        Text("Date: July 13, 2026")
          .frame(maxWidth: .infinity,
                 alignment: .leading)
        
        Text("Recepient: Michael Townley")
          .frame(maxWidth: .infinity,
                 alignment: .leading)
      }
    }
}

#Preview {
    TransactionListItemView()
}
