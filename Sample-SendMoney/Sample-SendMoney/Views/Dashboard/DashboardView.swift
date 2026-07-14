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
      // MARK: -- Error state view
      if viewModel.error != nil {
        VStack(spacing: 4.0) {
          Text(String(localized: "pageLoadError")).font(.subheadline).bold()
          Button {
            Task {
              await viewModel.fetchBalance()
            }
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
            // MARK: -- Balance label
            BalanceView(viewModel: balanceViewModel).frame(maxWidth: .infinity, alignment: .leading)
            // MARK: -- Mask and reload button
            Button {
              viewModel.isBalanceExposed.toggle()
            } label: {
              let maskIcon = viewModel.isBalanceExposed ? "eye.slash" : "eye"
              Image(systemName: maskIcon)
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .disabled(viewModel.isLoading || viewModel.error != nil)
            }
            
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
          
          // MARK: -- Send and transactions button
          HStack {
            TileButton(title: String(localized: "send"),
                       systemImageName: "arrow.up.forward",
                       background: Color.green.opacity(0.75),
                       action: {
              viewModel.path.append(NavigationPaths.sendMoney)
            })
            
            TileButton(title: String(localized: "transactions"),
                       systemImageName: "list.bullet",
                       background: Color.blue.opacity(0.75),
                       action: {
              viewModel.path.append(NavigationPaths.transactionHistory)
            })
          }
          
          // MARK: -- Logout button
          HorizontalButton(title: String(localized: "logout"),
                           background: Color.red.opacity(0.75),
                           action: {
            viewModel.logoutUser()
          })
          
        }
        .navigationDestination(for: NavigationPaths.self) { value in
          // MARK: -- Navigation
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
