import XCTest
@testable import DesignPatterns

class StrategyTests: XCTestCase {
  func test_bubbleSortIntegers_sortsAsExpected() {
    let sorter = Sorter(BubbleSortStrategy())
    let app = StrategyExampleApp(sorter: sorter)
    let sortedNumbers = app.sort(numbers: [1, 2, 5, 7, 4])
    XCTAssertEqual(sortedNumbers, [1, 2, 4, 5, 7])
  }
  
  func test_bubbleSortStrings_sortsAsExpected() {
    let sorter = Sorter(BubbleSortStrategy())
    let app = StrategyExampleApp(sorter: sorter)
    let sortedNumbers = app.sort(strings: ["Banana", "Pinapple", "Cacti", "Apple"])
    XCTAssertEqual(sortedNumbers, ["Apple", "Banana", "Cacti", "Pinapple"])
  }
  
  func test_updatingAlgorithms_worksAsExpected() {
    let unsortedIntegerValues = [1, 2, 5, 7, 4]

    let sorter = Sorter(HighToLowSortStrategy())
    let app = StrategyExampleApp(sorter: sorter)
    let sortedHighToLow = app.sort(numbers: unsortedIntegerValues)
    XCTAssertEqual(sortedHighToLow, [7, 5, 4, 2, 1])
    
    app.update(LowToHighSortStrategy())
    let sortedLowToHigh = app.sort(numbers: unsortedIntegerValues)
    XCTAssertEqual(sortedLowToHigh, [1, 2, 4, 5, 7])
  }
}
