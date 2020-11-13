public protocol Query {
  func pathWithQueryItems(for path: String?) -> URLComponents
}
