class PagedQueryBuilder: BaseQueryBuilder {
  public func take(_ take: Int) -> PagedQueryBuilder {
    items.append(URLQueryItem(name: "take", value: String(take)))
    return self
  }
  
  public func skip(_ skip: Int) -> PagedQueryBuilder {
    items.append(URLQueryItem(name: "skip", value: String(skip)))
    return self
  }
}
