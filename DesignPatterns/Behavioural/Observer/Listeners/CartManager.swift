class CartManager {
  private var cart: [Product] = []
  private var listeners: [CartListener] = []
  
  func add(product: Product) {
    cart.append(product)
    notifyListerners()
  }
  
  func remove(product: Product) {
    guard let index = cart.firstIndex(where: { $0.isEqual(to: product) }) else { return }
    cart.remove(at: index)
    notifyListerners()
  }
  
  func add(listener: CartListener) {
    listeners.append(listener)
  }
  
  func remove(listener: CartListener) {
    guard let index = listeners.firstIndex(where: {
      listener.description == $0.description
    }) else { return }
    
    listeners.remove(at: index)
  }

  private func notifyListerners() {
    let cartValue = cart.reduce(0) { return $0 + $1.price }
    listeners.forEach { $0.updated(cartValue: cartValue) }
  }
}
