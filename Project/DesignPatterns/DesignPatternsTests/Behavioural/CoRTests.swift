import XCTest
@testable import DesignPatterns

class CoRTests: XCTestCase {
  let locationHandler = LocationCheckHandler()
  let authHandler = AuthorisationHandler()
  let limitsHandler = LimitsHandler()
  let balanceHandler = BalanceCheckHandler()
  
  private func setupAllHandlers() {
    locationHandler
      .setNext(handler: authHandler)
      .setNext(handler: limitsHandler)
      .setNext(handler: balanceHandler)
  }

  func test_givenUserIsOutsideGeoBounds_throwLocationError() {
    let userOutOfBoundsRequest = makeRequest(isAuthorised: true, useBalance: 15, limitsCheckPassed: true, isWithinGeoBounds: false)
    assert(givenRequest: userOutOfBoundsRequest, expectedError: .outsideAllowedArea)
  }
  
  func test_givenUserIsUnauthorised_throwAuthError() {
    let userLoggedOutRequest = makeRequest(isAuthorised: false, useBalance: 15, limitsCheckPassed: true, isWithinGeoBounds: true)
    assert(givenRequest: userLoggedOutRequest, expectedError: .notAuthorised)
  }
  
  func test_givenBalanceTooLow_throwLowFundsError() {
    let balanceTooLowRequest = makeRequest(isAuthorised: true, useBalance: 3, limitsCheckPassed: true, isWithinGeoBounds: true)
    assert(givenRequest: balanceTooLowRequest, expectedError: .fundsToLow)
  }

  func test_givenLimitCheckFails_throwLimitError() {
    let failingLimitRequest = makeRequest(isAuthorised: true, useBalance: 15, limitsCheckPassed: false, isWithinGeoBounds: true)
    assert(givenRequest: failingLimitRequest, expectedError: .exceededLimits)
  }
  
  private func assert(givenRequest: PlayGameRequest, expectedError: CasinoGameError) {
    setupAllHandlers()
    
    let client = CasinoGameViewApp(locationHandler)

    XCTAssertThrowsError(try client.playGame(with: givenRequest)) { error in
      XCTAssertEqual(error as! CasinoGameError, expectedError)
    }
  }
  
  func test_passesAllChecks_gamePlays() {
    setupAllHandlers()
    
    let client = CasinoGameViewApp(locationHandler)

    let result = try! client.playGame(with: makeRequest(isAuthorised: true, useBalance: 15, limitsCheckPassed: true, isWithinGeoBounds: true))
    XCTAssertTrue(result)
  }
  
  func test_removeBalanceCheckFromHandlers_whenBalanceTooLow_doesNotFail() {
    let client = CasinoGameViewApp(locationHandler
                                    .setNext(handler: authHandler)
                                    .setNext(handler: limitsHandler))
    
    
    let negativeBalanceRequest = makeRequest(isAuthorised: true, useBalance: -100, limitsCheckPassed: true, isWithinGeoBounds: true)

    XCTAssertTrue(try! client.playGame(with: negativeBalanceRequest))
  }
}

extension CoRTests {
 func makeRequest(isAuthorised: Bool = false,
                   useBalance: Double = 0,
                   limitsCheckPassed: Bool = false,
                   isWithinGeoBounds: Bool = false) -> PlayGameRequest {
    PlayGameRequest(user: User(isAuthorised: isAuthorised,
                               userBalance: useBalance),
                    isUnderSpendingLimits: limitsCheckPassed,
                    casinoGame: MegaJackpotCasinoGame(), location:
                      Location(isWithinGeoBounds: isWithinGeoBounds))
  }
}
