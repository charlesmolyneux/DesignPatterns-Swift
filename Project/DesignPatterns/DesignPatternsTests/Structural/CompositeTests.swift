import XCTest
@testable import DesignPatterns

class CompositeConceptual: XCTestCase {
  
  func test_compositeTree_totalsCorrectly() {
    let client = CompositeAppExample()
    
    let result = client.execute(component: Leaf())
    
    XCTAssertEqual(result, 5)
  }
  
  func test_compositeTree_withMultipleBranches_totalsCorrectly() {
    let client = CompositeAppExample()
    
    let branch1 = Composite()
    branch1.add(component: Leaf())
    branch1.add(component: Leaf())
    branch1.add(component: Leaf())

    let branch2 = Composite()
    branch1.add(component: Leaf())
    
    let tree = Composite()
    tree.add(component: branch1)
    tree.add(component: branch2)
    
    let result = client.execute(component: tree)
    
    XCTAssertEqual(result, 20)
  }
}

