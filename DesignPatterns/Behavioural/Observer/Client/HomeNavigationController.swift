class HomeNavigationController: CartListener {
  private(set) var cartBalanceLabelText: String = ""
  private(set) var description: String = "HomeNavigationController"

  func updated(cartValue: Double) {
    cartBalanceLabelText = "HomeNavigationController: \(cartValue)"
  }
}
