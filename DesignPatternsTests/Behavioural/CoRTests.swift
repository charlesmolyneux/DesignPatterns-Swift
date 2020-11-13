import XCTest
@testable import DesignPatterns

class CoRTests: XCTestCase {
  var sampleApp: CasinoGameViewApp!
  
  override func setUp() {
   sampleApp = CasinoGameViewApp()
  }
  
  func test_givenUserIsOutsideGeoBounds_throwLocationError() {
    XCTAssertThrowsError(try sampleApp.playGame(with: makeRequest(isAuthorised: true, isWithinGeoBounds: false))) { error in
      XCTAssertEqual(error as! CasinoGameError, CasinoGameError.outsideAllowedArea)
    }
  }
  
  func test_givenUserIsUnauthorised_throwAuthError() {
    XCTAssertThrowsError(try sampleApp.playGame(with: makeRequest(isAuthorised: false, isWithinGeoBounds: true))) { error in
      XCTAssertEqual(error as! CasinoGameError, CasinoGameError.notAuthorised)
    }
  }
  
  func test_givenBalanceTooLow_throwLowFundsError() {
    XCTAssertThrowsError(try sampleApp.playGame(with: makeRequest(isAuthorised: true,
                                                                  useBalance: 3,
                                                                  limitsCheckPassed: true,
                                                                  isWithinGeoBounds: true))) { error in
      XCTAssertEqual(error as! CasinoGameError, CasinoGameError.fundsToLow)
    }
  }

  func test_givenLimitCheckFails_throwLimitError() {
    XCTAssertThrowsError(try sampleApp.playGame(with: makeRequest(isAuthorised: true,
                                                                  useBalance: 15,
                                                                  limitsCheckPassed: false,
                                                                  isWithinGeoBounds: true))) { error in
      XCTAssertEqual(error as! CasinoGameError, CasinoGameError.exceededLimits)
    }
  }
  
  func test_passesAllChecks_gamePlays() {
    let result = try! sampleApp.playGame(with: makeRequest(isAuthorised: true, useBalance: 15, limitsCheckPassed: true, isWithinGeoBounds: true))
    XCTAssertTrue(result)
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
