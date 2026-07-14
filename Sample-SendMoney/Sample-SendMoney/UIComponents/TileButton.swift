//
//  TileButton.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/14/26.
//

import SwiftUI

struct TileButton: View {
  let title: String
  var systemImageName: String = ""
  var background: Color = .blue
  let action: () -> Void
  
  var body: some View {
    VStack(spacing: 8.0) {
      Image(systemName: systemImageName)
        .foregroundStyle(.black)
        .fontWeight(.medium)
      Text(title)
    }.onTapGesture {
      action()
    }.frame(maxWidth: .infinity)
      .padding(16.0)
      .background(background)
      .clipShape(.buttonBorder)
  }
}

#Preview {
  TileButton(title: "Test", action: {})
}
