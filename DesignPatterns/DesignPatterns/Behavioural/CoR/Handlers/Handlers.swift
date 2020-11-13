protocol Handler: AnyObject {
  @discardableResult func setNext(handler: Handler) -> Handler
  func handle(request: PlayGameRequest) throws
  var nextHandler: Handler? { get set }
}

extension Handler {
  @discardableResult
  func setNext(handler: Handler) -> Handler {
    self.nextHandler = handler
    return handler
  }
}
