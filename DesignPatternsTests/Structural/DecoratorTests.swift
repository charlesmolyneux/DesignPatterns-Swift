import XCTest
@testable import DesignPatterns

class DecoratorTests: XCTestCase {
  func test_applyingUpperCaseDecorator_uppercases() {
    let decorator = UppercasedStringDecorator("some text")
    assert(given: decorator, expectedText: "SOME TEXT")
  }
  
  func test_applyingReverseCaseDecorator_uppercases() {
    let decorator = ReverseStringDecorator("some text")
    assert(given: decorator, expectedText: "txet emos")
  }
  
  func test_applyingMultipleDecorators_appliesCorrectFormatting() {
    let reverseStringDecorator = ReverseStringDecorator("some text")
    let upperCaseDecorator = UppercasedStringDecorator(reverseStringDecorator)
    assert(given: upperCaseDecorator, expectedText: "TXET EMOS")
  }
  
  func assert(given decorator: StringFormatter, expectedText: String) {
    let app = DecoratorAppExample()
    
    let value = app.apply(formatter: StringDecorator(decorator))
    
    XCTAssertEqual(value, expectedText)
  }
}
