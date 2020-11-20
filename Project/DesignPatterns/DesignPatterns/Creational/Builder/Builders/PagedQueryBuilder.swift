class PagedQueryBuilder: BaseQueryBuilder {
  public func take(_ take: Int) -> Self {
    items.append(URLQueryItem(name: "take", value: String(take)))
    return self
  }
  
  public func skip(_ skip: Int) -> Self {
    items.append(URLQueryItem(name: "skip", value: String(skip)))
    return self
  }
}
