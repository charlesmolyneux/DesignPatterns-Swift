struct CasinoGameViewApp {
  let locationHandler = LocationCheckHandler()
  let authHandler = AuthorisationHandler()
  let limitsHandler = LimitsHandler()
  let balanceHandler = BalanceCheckHandler()
  
  public init() {
    setupHandlers()
  }
  
  private func setupHandlers() {
    locationHandler
      .setNext(handler: authHandler)
      .setNext(handler: limitsHandler)
      .setNext(handler: balanceHandler)
  }
  
  public func playGame(with request: PlayGameRequest) throws -> Bool  {
    do {
      try locationHandler.handle(request: request)
      return true
    } catch {
      throw error
    }
  }
}
