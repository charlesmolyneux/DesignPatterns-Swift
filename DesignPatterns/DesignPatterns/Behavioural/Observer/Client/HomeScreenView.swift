class HomeScreenView: CartListener {
  private(set) var cartBalanceLabelText: String = ""
  private(set) var description: String = "HomeScreenView"
  
  func updated(cartValue: Double) {
    cartBalanceLabelText = "HomeScreenView: \(cartValue)"
  }
}
