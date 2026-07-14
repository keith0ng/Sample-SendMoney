//
//  TransactionHistory.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/13/26.
//

import Foundation

struct Transaction {
  let id: Int
  let name: String
  let username: String
  let amount: Double
  let email: String
  let phone: String
  let date: String
  
  static let example: Transaction = .init(
    id: 999999,
    name: "Michael Townley",
    username: "michael",
    amount: 100.00,
    email: "michael_townley@example.com",
    phone: "+16465551212",
    date: "July 14, 2026"
  )
}

extension Transaction: Codable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case username
    case amount
    case email
    case phone
    case date
  }
  
  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decodeIfPresent(Int.self,
                                            forKey: CodingKeys.id) ?? 9999
    
    self.name = try container.decodeIfPresent(String.self,
                                              forKey: CodingKeys.name) ?? ""
    
    self.username = try container.decodeIfPresent(String.self,
                                                  forKey: CodingKeys.username) ?? ""
    
    self.amount = try container.decodeIfPresent(Double.self,
                                                forKey: CodingKeys.amount) ?? 0.0
    
    self.email = try container.decodeIfPresent(String.self,
                                               forKey: CodingKeys.email) ?? ""
    
    self.phone = try container.decodeIfPresent(String.self,
                                               forKey: CodingKeys.phone) ?? ""
    
    self.date = try container.decodeIfPresent(String.self,
                                              forKey: CodingKeys.date) ?? "\(Date.now.ISO8601Format())"
  }
}
