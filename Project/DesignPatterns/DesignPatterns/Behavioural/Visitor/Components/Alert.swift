protocol Alert {
  func accept(visitor: AlertPolicy) -> Bool
}
