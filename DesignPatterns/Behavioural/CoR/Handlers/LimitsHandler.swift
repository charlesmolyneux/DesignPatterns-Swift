class LimitsHandler: Handler {
  var nextHandler: Handler?

  func handle(request: PlayGameRequest) throws {
    guard request.isUnderSpendingLimits else {
      throw CasinoGameError.exceededLimits
    }
    
    try nextHandler?.handle(request: request)
  }
}
