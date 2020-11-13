public protocol Strategy {
  func sort<T: Comparable>(values: [T]) -> [T]
}
