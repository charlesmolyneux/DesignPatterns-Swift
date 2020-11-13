class LocationCheckHandler: Handler {
  var nextHandler: Handler?

  func handle(request: PlayGameRequest) throws {
    guard request.location.isWithinGeoBounds else {
      throw CasinoGameError.outsideAllowedArea
    }
    
    try nextHandler?.handle(request: request)
  }
}
