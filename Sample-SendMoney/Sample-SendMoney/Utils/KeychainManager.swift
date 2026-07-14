//
//  KeychainManager.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

import Foundation
import Security

class KeychainManager {
  static let shared = KeychainManager()
  
  var username: String?  
  var password: String? {
    get {
      readCrendentials(for: username ?? "")
    }
    set {
      if let newValue = newValue {
        try? saveCredentials(username: username ?? "", password: newValue)
      } else {
        deleteCredentials(username: username ?? "")
      }
    }
  }
  
  private init() {
    
  }
  
  private let service = "com.sample.sendMoney.Sample-SendMoney"
  
  enum KeychainError: Error {
    case duplicateItem
    case unknown(OSStatus)
  }
  
  private func saveCredentials(username: String, password: String) throws {
    guard let passwordData = password.data(using: .utf8) else { return }
    
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: service,
      kSecAttrAccount: username,
      kSecValueData: passwordData
    ]
    
    let status = SecItemAdd(query as CFDictionary, nil)
    
    if status == errSecDuplicateItem {
      try updateCredentials(username: username, password: password)
    } else if status != errSecSuccess {
      throw KeychainError.unknown(status)
    }
  }
  
  private func readCrendentials(for username: String) -> String? {
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: service,
      kSecAttrAccount: username,
      kSecReturnData: true,
      kSecMatchLimit: kSecMatchLimitOne
    ]
    
    var dataTypeRef: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
    
    guard status == errSecSuccess, let data = dataTypeRef as? Data else {
      return nil
    }
    
    return String(data: data, encoding: .utf8)
  }
  
  private func updateCredentials(username: String, password: String) throws {
    guard let passwordData = password.data(using: .utf8) else { return }
    
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: service,
      kSecAttrAccount: username
    ]
    
    let attributesToUpdate: [CFString: Any] = [
      kSecValueData: passwordData
    ]
    
    let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
    
    if status != errSecSuccess {
      throw KeychainError.unknown(status)
    }
  }
  
  private func deleteCredentials(username: String) {
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: service,
      kSecAttrAccount: username
    ]
    
    SecItemDelete(query as CFDictionary)
  }
}
