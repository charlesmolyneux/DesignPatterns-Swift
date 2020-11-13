protocol Product {
  var id: Int { get }
  var displayName: String { get }
  var price: Double { get }
}

extension Product {
  func isEqual(to product: Product) -> Bool {
    return id == product.id
  }
}
