class PurchaseProxyService: PurchaseService {
  private let purchaseService: PurchaseService
  private let loginService: LoginService
  private let analyticsService: AnalyticsService
  private let state: ApplicationState
  
  init(purchaseService: PurchaseService, loginService: LoginService, analyticsService: AnalyticsService, state: ApplicationState) {
    self.purchaseService = purchaseService
    self.loginService = loginService
    self.analyticsService = analyticsService
    self.state = state
  }
  
  //Mark Method signature matches the signature of the service we're acting as a proxy for.
  func purchase(user: StoreUser, purchase game: VideoGame, completion: @escaping (Result<Receipt, Error>) -> Void) {
    analyticsService.log(event: "purchase started: \(game.displayName)-\(game.id)")
    
    guard state.isAuthenticated else {
      return loginThenPurchase(user, game, completion)
    }
   
    purchase(for: user, purchase: game, completion: completion)
  }
  
  private func loginThenPurchase(_ user: StoreUser, _ game: VideoGame, _ completion: @escaping (Result<Receipt, Error>) -> Void) {
    loginService.login(username: user.username, password: user.password) { result in
      switch result {
      case .success(let user):
        self.analyticsService.log(event: "Login Success: \(user.username)")
        self.purchase(user: user, purchase: game, completion: completion)
      case .failure:
        completion(.failure(PurchaseError.serviceError))
      }
    }
  }
  
  private func purchase(for user: StoreUser, purchase game: VideoGame, completion: @escaping (Result<Receipt, Error>) -> Void) {
    purchaseService.purchase(user: user, purchase: game) { result in
      switch result {
      case .success(let receipt):
      self.analyticsService.log(event: "Purchase Success: \(receipt.totalCost)")
      completion(.success(receipt))
      case .failure(_):
        self.analyticsService.log(event: "Purchase Failed: \(game.displayName)-\(game.id)")
        completion(.failure(PurchaseError.purchaseFailed))
      }
    }
  }
  
  enum PurchaseError: Error {
    case purchaseFailed
    case loginFailed
    case serviceError
  }
}

