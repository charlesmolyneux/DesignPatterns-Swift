@testable import DesignPatterns

class MockDigitalPurchaseService: EBookPurchaseService {
  public var expectedResponse: PurchaseResponse!
  
  func purchase(_ book: EBook, completion: @escaping (PurchaseResponse) -> Void) {
    completion(expectedResponse)
  }
}
