//
//  Sample_SendMoneyTests.swift
//  Sample-SendMoneyTests
//
//  Created by Keith Samson on 7/15/26.
//

import Testing
import XCTest
@testable import Sample_SendMoney



/**
 
 Also add here if the team requires Network requests to be tested.
 Ideally, it's less necssary for network requests to be tested since
 backend team is the one responsible for it.
 
 Most of the unit tests added here are local business logic that is
 when values and validations are computed in our codebase.
 
 */

@Suite("Login Tests")
struct LoginTests {
  @Test("Testing if empty username would fail")
  func testEmptyUsernameShouldFail() {
    let loginVM = LoginView.ViewModel()
    
    loginVM.username = ""
    
    #expect(loginVM.isLoginValid == false)
  }

  @Test("Testing if empty password would fail")
  func testEmptyPasswordShouldFail() {
    let loginVM = LoginView.ViewModel()
    
    loginVM.password = ""
    
    #expect(loginVM.isLoginValid == false)
  }
  
  @Test("Testing if supplied both username and password would succeed")
  func testSuppliedCredentialsShouldSucceed() {
    let loginVM = LoginView.ViewModel()
    
    loginVM.username = "test"
    loginVM.password = "test"
    
    #expect(loginVM.isLoginValid == true)
  }

}

struct DashboardTests {
  
}

@Suite("SendMoney Tests")
struct SendMoneyTests {
  @Test("Testing if amount field is not empty")
  func testEmptyAmountFieldShouldFail() {
    let sendMoneyVM = SendMoneyView.ViewModel()
    
    sendMoneyVM.amountToSend = 0.0
    
    #expect(sendMoneyVM.isSendMoneyValid == false)
  }
  
  @Test("Testing if amount field is not empty")
  func testEmptyAmountIsLessThanZeroShouldFail() {
    let sendMoneyVM = SendMoneyView.ViewModel()
    
    sendMoneyVM.amountToSend = -1.0
    
    #expect(sendMoneyVM.isSendMoneyValid == false)
  }
  
  @Test("Testing if amount being sent is within remaining balance")
  func testEmptyAmountFieldIsAboveBalanceShouldFail() {
    let sendMoneyVM = SendMoneyView.ViewModel()
    sendMoneyVM.userBalance = 1000.0
    sendMoneyVM.amountToSend = 1001.0
    
    #expect(sendMoneyVM.isSendMoneyValid == false)
  }
}

struct TransactionTests {
  
}
