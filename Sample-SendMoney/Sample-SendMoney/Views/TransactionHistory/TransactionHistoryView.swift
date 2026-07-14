//
//  TransactionHistoryView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct TransactionHistoryView: View {
  
  @ObservedObject var viewModel = ViewModel()
  
  var body: some View {
    ZStack {
      if viewModel.transactions.isEmpty && !viewModel.isLoading {
        VStack(spacing: 4.0) {
          Text("No results found.").font(.subheadline).bold()
          Button {
            Task {
              await viewModel.fetchTransactions()
            }
          } label: {
            Image(systemName: "arrow.clockwise")
              .foregroundStyle(.black)
              .fontWeight(.medium)
          }
        }
      } else if viewModel.isLoading {
        ProgressView()
          .progressViewStyle(.circular)
          .scaleEffect(2.0,
                       anchor: .center)
      } else if viewModel.error != nil {
        VStack(spacing: 4.0) {
          Text("There's been an error loading this page.").font(.subheadline).bold()
          Button {
            Task {
              await viewModel.fetchTransactions()
            }
          } label: {
            Image(systemName: "arrow.clockwise")
              .foregroundStyle(.black)
              .fontWeight(.medium)
          }
        }
      } else {
        List {
          ForEach(viewModel.transactions, id: \.id) { transaction in
            let transactionListItemViewModel = TransactionListItemView.ViewModel(
              transaction: transaction)
            TransactionListItemView(viewModel: transactionListItemViewModel)
          }
        }
      }
    }.task {
      await viewModel.fetchTransactions()
    }
  }
}

#Preview {
  TransactionHistoryView()
}
