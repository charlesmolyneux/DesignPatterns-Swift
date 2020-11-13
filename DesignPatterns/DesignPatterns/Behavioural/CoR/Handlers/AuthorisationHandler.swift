class AuthorisationHandler: Handler {
  var nextHandler: Handler?

  func handle(request: PlayGameRequest) throws {
    guard request.user.isAuthorised else {
      throw CasinoGameError.notAuthorised
    }
    
    try nextHandler?.handle(request: request)
  }
}
