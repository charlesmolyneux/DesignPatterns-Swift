protocol Monster {
  func attack() -> Int
  var health: Int { get }
}

//We can provide a default implementation
extension Monster {
  func attack() -> Int {
    return 1
  }
}
