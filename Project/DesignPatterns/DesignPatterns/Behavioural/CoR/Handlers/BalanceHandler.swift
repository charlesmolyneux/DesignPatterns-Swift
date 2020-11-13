class BalanceCheckHandler: Handler {
  var nextHandler: Handler?

  func handle(request: PlayGameRequest) throws {
    guard Double(request.casinoGame.costPerPlay) <= request.user.userBalance else {
      throw CasinoGameError.fundsToLow
    }
    
    try nextHandler?.handle(request: request)
  }
}
