/*
  Domain specific interface to be used by the client.
 */

public protocol PurchaseProtocol {
  func purchase(_ book: Book, for platform: DeliveryMethod, completion: @escaping (PurchaseResult) -> Void)
}
