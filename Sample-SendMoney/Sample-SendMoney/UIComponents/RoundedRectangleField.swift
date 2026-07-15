//
//  RoundedRectangleField.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/14/26.
//

import SwiftUI

/// A reusable field that spans the whole width of the container.
/// It also has a rounded rectangle corner.
struct RoundedRectangleField: View {
  let text: Binding<String>
  let placeholder: String
  var isSecureField: Bool = false
  var errorText: String? = nil
  
  
  var body: some View {
    VStack {
      if isSecureField {
        SecureField(placeholder,
                    text: text).textFieldStyle(RoundedBorderTextFieldStyle())
      } else {
        TextField(placeholder,
                  text: text).textFieldStyle(RoundedBorderTextFieldStyle())
      }
      if let errorText = errorText {
        Text(errorText).frame(maxWidth: .infinity,
                              alignment: .leading)
        .foregroundStyle(.red)
      }
    }
  }
}

#Preview {
  RoundedRectangleField(text: .constant(""), placeholder: "placeholder")
}
