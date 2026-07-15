//
//  NetworkManager.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/14/26.
//

import Foundation

class NetworkManager {
  private let baseURL: String
  private let session: URLSession
  
  init(baseURL: String, session: URLSession = .shared) {
    self.baseURL = baseURL
    self.session = session
  }
  
  private func createRequest(_ endpoint: String,
                             method: NetworkHTTPMethod,
                             body: Data? = nil) throws -> URLRequest {
    guard let url = URL(string: "\(baseURL)\(endpoint)") else {
      throw NetworkError.invalidURL
    }
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = body
    return request
  }
}

extension NetworkManager {
  func get<T: Decodable>(endpoint: String) async throws -> T {
    let request = try createRequest(endpoint, method: .get)
    let (data, response) = try await session.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
      throw NetworkError.networkError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
    }
    
    do {
      let decoded = try JSONDecoder().decode(T.self, from: data)
      return decoded
    } catch {
      throw NetworkError.decodingError(error)
    }
  }
  
  func post<T: Encodable, U: Decodable>(endpoint: String, body: T) async throws -> U {
    do {
      let data = try JSONEncoder().encode(body)
      let request = try createRequest(endpoint, method: .post, body: data)
      let (responseData, response) = try await session.data(for: request)
      
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.networkError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
      }
      
      do {
        return try JSONDecoder().decode(U.self, from: responseData)
      } catch {
        throw NetworkError.decodingError(error)
      }
    } catch {
      throw NetworkError.encodingError(error)
    }
  }
}
