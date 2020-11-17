import XCTest
@testable import DesignPatterns

class SingletonTests: XCTestCase {
  let mockLogger = MockAnalyticsLogger()

  func test_instanceIsTheSame() {
    let analyticsLoggerOne = ArcadeAnalyticsLogger(logger: FirebaseAnalyticsService())
    let analyticsLoggerTwo = ArcadeAnalyticsLogger(logger: FirebaseAnalyticsService())
    XCTAssertTrue(analyticsLoggerOne.shared === analyticsLoggerTwo.shared)
  }
  
  func test_loggingFromOneScreen_wontLogAgainOnSecondScreen() {
    let arcadeListView = ArcadeListView(analytics: ArcadeAnalyticsLogger(logger: mockLogger))
    let arcadeFilteredView = ArcadeFilteredListView(analytics: ArcadeAnalyticsLogger(logger: mockLogger))

    arcadeListView.didScroll(to: "Space Invaders")
    arcadeListView.didScroll(to: "Mario Kart")
    arcadeFilteredView.didScroll(to: "Space Invaders")
    arcadeFilteredView.didScroll(to: "Donkey Kong")
    arcadeListView.didScroll(to: "Donkey Kong")

    XCTAssertEqual(mockLogger.loggedEvents, ["Space Invaders was displayed on screen",
                                             "Mario Kart was displayed on screen",
                                             "Donkey Kong was displayed on screen"])
    XCTAssertEqual(mockLogger.loggedEvents.count, 3)
  }
}
