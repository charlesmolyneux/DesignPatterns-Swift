import XCTest
@testable import DesignPatterns

class ObserverTests: XCTestCase {
  var homeScreenView: HomeScreenView!
  var homeNavController: HomeNavigationController!
  
  override func setUp() {
    super.setUp()
    homeScreenView = HomeScreenView()
    homeNavController = HomeNavigationController()
  }
  
  func test_observers_getNotifiedOfUpdate() {
    let cartManager = CartManager()
        
    cartManager.add(listener: homeScreenView)
    cartManager.add(listener: homeNavController)
    
    let product = VideoGame(id: 1, displayName: "Final Fantasty VII", price: 44.44)
    let product2 = VideoGame(id: 32, displayName: "Fallout 3", price: 8.99)

    cartManager.add(product: product)
    assert(homeScreenAmount: "44.44", homeNavigationAmount: "44.44")

    cartManager.add(product: product2)
    assert(homeScreenAmount: "53.43", homeNavigationAmount: "53.43")
    
    cartManager.remove(product: product)
    assert(homeScreenAmount: "8.99", homeNavigationAmount: "8.99")
    
    cartManager.remove(listener: homeScreenView)
    cartManager.add(product: product2)
    assert(homeScreenAmount: "8.99", homeNavigationAmount: "17.98")
  }
  
  func assert(homeScreenAmount: String, homeNavigationAmount: String) {
    XCTAssertEqual(homeScreenView.cartBalanceLabelText, "HomeScreenView: \(homeScreenAmount)")
    XCTAssertEqual(homeNavController.cartBalanceLabelText, "HomeNavigationController: \(homeNavigationAmount)")
  }
}
