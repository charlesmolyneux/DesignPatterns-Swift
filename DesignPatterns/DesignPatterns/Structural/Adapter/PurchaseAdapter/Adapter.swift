public class PurchaseServiceAdapter: PurchaseProtocol {
  private let service: EBookPurchaseService
  
  public init(service: EBookPurchaseService) {
    self.service = service
  }
  
  public func purchase(_ book: Book, for platform: DeliveryMethod, completion: @escaping (PurchaseResult) -> Void) {
    guard let deliveryMethod = map(deliveryMethod: platform) else {
      return completion(.purchaseFailed)
    }
    
    let eBook = transform(book: book, for: deliveryMethod)
    service.purchase(eBook) { response in
      switch response {
      case .success:
        completion(.purchaseSuccess)
      case .failure:
        completion(.purchaseFailed)
      }
    }
  }
  
  private func transform(book: Book, for platform: EBook.DigitalPlatform) -> EBook {
    return EBook(price: book.price, isbn: book.isbn, platform: platform)
  }
  
  private func map(deliveryMethod: DeliveryMethod) -> EBook.DigitalPlatform? {
    switch deliveryMethod {
    case .amazon: return .amazon
    case .google: return .amazon
    case .iBooks: return .appleBooks
    case .kindle: return .kindle
    case .physical: return nil
    }
  }
}

public enum PurchaseResult {
  case purchaseSuccess
  case purchaseFailed
}
