//
//  ContentView.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import SwiftUI

struct LandingView: View {
  
  @AppStorage(Constants.loggedinUserKey) var loggedInUser: String?
  
  var body: some View {
    
    // Ideally you need to match the current logged in user's
    // password with the one in the keychain manager.
    // But the checking was skipped because of a bug
    // that doesn't persist the session of the user.
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
