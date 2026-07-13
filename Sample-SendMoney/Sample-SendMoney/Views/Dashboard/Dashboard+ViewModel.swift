//
//  Dashboard+ViewModel.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation
import SwiftUI

extension DashboardView {
  class ViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var userBalance: Double = 1000.0
    @Published var path = NavigationPath()
    @Published var isBalanceExposed: Bool = false
    @AppStorage("loggedInUser") var loggedInUser: String?
    
    func logoutUser() {
      KeychainManager.shared.password = nil
      KeychainManager.shared.username = nil
      loggedInUser = nil
    }
  }
}
