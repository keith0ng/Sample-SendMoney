//
//  ContentView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct LandingView: View {
  @AppStorage("isLoggedIn") private var isLoggedIn: Bool?
  var body: some View {
    if let loggedIn = isLoggedIn, loggedIn {
      DashboardView()
    } else {
      LoginView()
    }
  }
}

#Preview {
  LandingView()
}
