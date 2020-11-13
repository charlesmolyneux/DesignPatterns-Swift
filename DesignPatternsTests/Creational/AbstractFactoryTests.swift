import XCTest
import DesignPatterns

class AbstractFactoryTests: XCTestCase {
  func test_usingRetroFactory_createsRetroFurniture() {
    let app = AbstractFurnitureAppExample(RetroFurnitureFactory())
    
    XCTAssertTrue(app.create(item: .chair) is RetroChair)
    XCTAssertTrue(app.create(item: .table) is RetroTable)
  }
  
  func test_usingModernFactory_createsModernFurniture() {
    let app = AbstractFurnitureAppExample(ModernFurnitureFactory())
    
    XCTAssertTrue(app.create(item: .chair) is ModernChair)
    XCTAssertTrue(app.create(item: .table) is ModernTable)
  }
}
