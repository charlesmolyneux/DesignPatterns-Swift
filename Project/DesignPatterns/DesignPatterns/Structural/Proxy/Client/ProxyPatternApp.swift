class CartView {
  let user = StoreUser(username: "123", password: "password123") //This would be retrieved
  
  private lazy var purchaseService: PurchaseProxyService = {
    let loginService = DefaultLoginService()
    let purchaseService = DefaultPurchaseService()
    let analytics = FirebaseAnalyticsService()
    return PurchaseProxyService(purchaseService: purchaseService, loginService: loginService, analyticsService: analytics, state: ApplicationStateStore())
  }()
  
  //@IBAction tap Buy Button on Product Page
  public func purchase(item: VideoGame) {
    purchaseService.purchase(user: user, purchase: item) { result in
      switch result {
      case .success(_):
        return //Go To Success Screen
      case .failure(_):
        return //Display error Alert
      }
    }
  }
}

