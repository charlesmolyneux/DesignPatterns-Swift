import XCTest
@testable import DesignPatterns

class AdapterTests: XCTestCase {
  var delegate: PurchaseResultDelegateStub!
  var digitalPurchaseService: MockDigitalPurchaseService!
  var app: OnlineBookStoreListView!
  
  override func setUp() {
    super.setUp()
    digitalPurchaseService = MockDigitalPurchaseService()
    let purchaseService = PurchaseServiceAdapter(service: digitalPurchaseService)
    
    app = OnlineBookStoreListView(purchaseService: purchaseService)
    self.delegate = PurchaseResultDelegateStub()
    app.delegate = self.delegate
  }

  func test_givenUnsupportedBookType_didFailPurchaseCalled() {
    assert(when: .physical, networkResponse: .success, expectedFailureCount: 1)
  }
  
  func test_givenSupportedBook_whenPurchaseSuccess_didPurchaseBookCalled() {
    assert(when: .kindle, networkResponse: .success, expectedSuccessCount: 1)
  }
  
  func test_givenSupportedBook_whenPurchaseFails_didFailPurchaseCalled() {
    assert(when: .kindle, networkResponse: .failure, expectedFailureCount: 1)
  }
  
  func assert(when deliveryMethod: DeliveryMethod, networkResponse: PurchaseResponse, expectedSuccessCount: Int = 0, expectedFailureCount: Int = 0) {
    digitalPurchaseService.expectedResponse = networkResponse

    app.purchase(book: Book(title: "Gang of Four",
                            isbn: "0-201-63361-2",
                            price: 34.99), selected: deliveryMethod)
    
    XCTAssertEqual(delegate.didFailPurchaseCallCount, expectedFailureCount)
    XCTAssertEqual(delegate.didPurchaseBookCallCount, expectedSuccessCount)
  }
}

class PurchaseResultDelegateStub: PurchaseDelegate {
  var didPurchaseBookCallCount: Int = 0
  var didFailPurchaseCallCount: Int = 0
  
  func didPurchaseBook() {
    didPurchaseBookCallCount += 1
  }
  
  func didFailPurchase() {
    didFailPurchaseCallCount += 1
  }
}
