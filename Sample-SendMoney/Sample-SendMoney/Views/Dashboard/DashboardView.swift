//
//  DashboardView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct DashboardView: View {
  
  @ObservedObject var viewModel = ViewModel()
  
  var body: some View {
    NavigationStack(path: $viewModel.path) {
      if viewModel.error != nil {
        VStack(spacing: 4.0) {
          Text("There's been an error loading this page.").font(.subheadline).bold()
          Button {
            // Refetch balance
          } label: {
            Image(systemName: "arrow.clockwise")
              .foregroundStyle(.black)
              .fontWeight(.medium)
          }
        }
      } else {
        VStack(alignment: .leading, spacing: 16.0) {
          
          let balanceViewModel = BalanceView.ViewModel(balance: viewModel.userBalance,
                                                       isBalanceExposed: viewModel.isBalanceExposed,
                                                       isLoading: viewModel.isLoading,
                                                       error: viewModel.error)
          HStack {
            // Balance view
            BalanceView(viewModel: balanceViewModel).frame(maxWidth: .infinity, alignment: .leading)
            // Mask balance button
            Button {
              viewModel.isBalanceExposed.toggle()
            } label: {
              let maskIcon = viewModel.isBalanceExposed ? "eye.slash" : "eye"
              Image(systemName: maskIcon)
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .disabled(viewModel.isLoading || viewModel.error != nil)
            }
            
            // Refetch balance button
            Button {
              Task {
                await viewModel.fetchBalance()
              }
            } label: {
              Image(systemName: "arrow.clockwise")
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .disabled(viewModel.isLoading)
            }
          }
          
          HStack {
            // Send Button
            VStack(spacing: 8.0) {
              Image(systemName: "arrow.up.forward")
                .foregroundStyle(.black)
                .fontWeight(.medium)
              Text("Send")
            }.onTapGesture {
              viewModel.path.append(NavigationPaths.sendMoney)
            }.frame(maxWidth: .infinity)
              .padding(16.0)
              .background(Color.green.opacity(0.25))
              .clipShape(.buttonBorder)
            
            // Transactions Button
            VStack(spacing: 8.0) {
              Image(systemName: "list.bullet")
                .foregroundStyle(.black)
                .fontWeight(.medium)
              Text("Transactions")
            }.onTapGesture {
              viewModel.path.append(NavigationPaths.transactionHistory)
            }.frame(maxWidth: .infinity)
              .padding(16.0)
              .background(Color.blue.opacity(0.25))
              .clipShape(.buttonBorder)
          }
          
          // Logout Button
          Button("Logout") {
            viewModel.logoutUser()
          }.frame(maxWidth: .infinity)
            .padding(8.0)
            .background(Color.red.opacity(0.25))
            .foregroundStyle(.black)
            .clipShape(.buttonBorder)
        }
        .navigationDestination(for: NavigationPaths.self) { value in
          switch value {
          case .sendMoney:
            SendMoneyView()
          case .transactionHistory:
            TransactionHistoryView()
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16.0)
      }
    }.task {
      await viewModel.fetchBalance()
    }
  }
}

#Preview {
  DashboardView()
}
