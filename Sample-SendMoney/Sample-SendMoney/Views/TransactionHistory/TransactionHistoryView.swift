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
    // MARK: -- Empty State
    ZStack {
      // Only show the empty state when the transactions is
      // actually empty after the view has stopped loading.
      if viewModel.transactions.isEmpty && !viewModel.isLoading {
        VStack(spacing: 4.0) {
          Text(String(localized: "emptyQuery")).font(.subheadline).bold()
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
        // MARK: -- Loading state
        ProgressView().progressViewStyle(.circular).scaleEffect(2.0, anchor: .center)
      } else if viewModel.error != nil {
        // MARK: -- Error state
        VStack(spacing: 4.0) {
          Text(String(localized: "pageLoadError")).font(.subheadline).bold()
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
        // MARK: -- Normal state
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
