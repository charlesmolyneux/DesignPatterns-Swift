class BaseQueryBuilder: Query {
  public var items: [URLQueryItem] = []

  public init () { }

  public func append(item: URLQueryItem) {
    items.append(item)
  }
  
  open func pathWithQueryItems(for path: String?) -> URLComponents {
    var urlComponent = URLComponents(string: path ?? "") ?? URLComponents()
    let queryItems = urlComponent.queryItems ?? []
    urlComponent.queryItems = queryItems + items
    return urlComponent
  }
}
