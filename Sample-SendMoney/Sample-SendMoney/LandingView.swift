//
//  ContentView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct LandingView: View {
  
  @AppStorage("loggedInUser") var loggedInUser: String?
  
  var body: some View {
    
    if let loggedInUser = loggedInUser,
       !loggedInUser.isEmpty {
      DashboardView()
    } else {
      LoginView()
    }
  }
}

#Preview {
  LandingView()
}
