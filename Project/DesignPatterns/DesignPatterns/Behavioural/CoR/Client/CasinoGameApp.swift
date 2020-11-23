struct CasinoGameViewApp {
  private let handler: Handler
  
  public init(_ handler: Handler) {
    self.handler = handler
  }
  
  public func playGame(with request: PlayGameRequest) throws -> Bool  {
    do {
      try handler.handle(request: request)
      return true
    } catch {
      throw error
    }
  }
}
