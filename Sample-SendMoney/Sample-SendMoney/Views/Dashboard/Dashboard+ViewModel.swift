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
    @AppStorage("isLoggedIn") var isLoggedIn: Bool?
    @Published var userBalance: Double = 1000.0
    @Published var path = NavigationPath()
    @Published var isBalanceExposed: Bool = false
    
  }
}
