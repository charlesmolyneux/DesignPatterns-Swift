import XCTest
@testable import DesignPatterns

class ArcadeGameQueryBuilderTests: XCTestCase {
  func test_queryBuildsCorrctly() {
    let query = ArcadeGameQueryBuilder().genre(.fantasy).skip(5).take(10).pathWithQueryItems(for: "game-query").string
    XCTAssertEqual(query, "game-query?genre=fantasy&skip=5&take=10")
  }
  
  func test_queryBuilderWithoutSkipMethod() {
    let query = ArcadeGameQueryBuilder().genre(.fantasy).take(10).pathWithQueryItems(for: "game-query").string
    XCTAssertEqual(query, "game-query?genre=fantasy&take=10")
  }
}
