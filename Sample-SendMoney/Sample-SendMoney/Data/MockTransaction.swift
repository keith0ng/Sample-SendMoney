//
//  MockTransaction.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/14/26.
//

import Foundation

// This is only for the purpose of simulating sending a POST request
struct MockTransaction: Codable, Identifiable {
  let id: Int
  let title: String
  let body: String
  let userId: String
}
