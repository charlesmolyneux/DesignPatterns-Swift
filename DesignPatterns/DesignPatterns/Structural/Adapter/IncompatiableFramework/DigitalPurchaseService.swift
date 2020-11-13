public protocol EBookPurchaseService {
  func purchase(_ book: EBook, completion: @escaping (PurchaseResponse) -> Void)
}

public class DigitalPurchaseService: EBookPurchaseService {
  public init() { }
  
  public func purchase(_ book: EBook, completion: @escaping (PurchaseResponse) -> Void) {
    completion(.success)
  }
}
