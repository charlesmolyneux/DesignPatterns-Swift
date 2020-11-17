protocol PurchaseService {
  func purchase(user: StoreUser, purchase: VideoGame, completion: @escaping (Result<Receipt, Error>) -> Void)
}

class DefaultPurchaseService: PurchaseService {
  
  func purchase(user: StoreUser, purchase: VideoGame, completion: (Result<Receipt, Error>) -> Void) {
    //let body = makeBody(with: user, purchase: purchase)
    //network.makeRequest(with: body, completion: completion)
  }
}



struct Receipt {
  public let purchaseId: String
  public let totalCost: Double
}
