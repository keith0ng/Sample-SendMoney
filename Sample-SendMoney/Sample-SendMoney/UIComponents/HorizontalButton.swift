//
//  HorizontalButton.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/14/26.
//

import SwiftUI

struct HorizontalButton: View {
  let title: String
  var background: Color = .white
  var foreground: Color = .white
  var disabled: Bool = false
  let action: () -> Void
  
  var body: some View {
    Button(title) {
      action()
    }.frame(maxWidth: .infinity)
      .padding(8.0)
      .background(background)
      .foregroundStyle(foreground)
      .clipShape(.buttonBorder)
      .disabled(disabled)
  }
}

#Preview {
  HorizontalButton(title: "Button", action: {})
}
