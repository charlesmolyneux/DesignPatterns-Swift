public protocol PurchaseDelegate: AnyObject {
  func didPurchaseBook()
  func didFailPurchase()
}

// The Client can take any class that implements the 'PurchaseProtocol'
public class OnlineBookStoreListView: PurchaseDelegate {
  private let purchaseService: PurchaseProtocol
  public weak var delegate: PurchaseDelegate?
  
  public init(purchaseService: PurchaseProtocol) {
    self.purchaseService = purchaseService
  }
  
  //@IBAction - fake purchase tap
  public func purchase(book: Book, selected deliveryOption: DeliveryMethod) {
    purchaseService.purchase(book, for: deliveryOption) { result in
      guard case .purchaseSuccess = result else {
        return self.didFailPurchase()
      }
      
      self.didPurchaseBook()
    }
  }
  
  public func didPurchaseBook() {
    delegate?.didPurchaseBook()
  }
  
  public func didFailPurchase() {
    delegate?.didFailPurchase()
  }
}

