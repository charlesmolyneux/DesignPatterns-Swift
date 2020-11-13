import XCTest
@testable import DesignPatterns

class FactoryTests: XCTestCase {
  func test_conjureWithDefaultFactory_makesCorrectAttack() {
    let exampleApp = FactoryAppExample(factory: DefaultMonsterFactory())
    XCTAssertEqual(exampleApp.attackWith(monster: .dinosaur), 50)
    XCTAssertEqual(exampleApp.attackWith(monster: .dragon), 500)
    XCTAssertEqual(exampleApp.attackWith(monster: .snake), 15)
  }
  
  func test_conjureWithSuperchargedMonsterFactory_makesCorrectAttack() {
    let superChargedMonsterFactory = SuperChargedMonsterFactory()
    let exampleApp = FactoryAppExample(factory: superChargedMonsterFactory)
    XCTAssertEqual(exampleApp.attackWith(monster: .dinosaur), 650)
    XCTAssertEqual(exampleApp.attackWith(monster: .dragon), 650)
    XCTAssertEqual(exampleApp.attackWith(monster: .snake), 650)
    
    if let monster = superChargedMonsterFactory.conjure(monster: .dinosaur) as? SuperMonster {
      XCTAssertEqual(monster.superAttack(), 1600)
    } else {
      XCTFail("Expected a Super Attack!")
    }
  }
}
