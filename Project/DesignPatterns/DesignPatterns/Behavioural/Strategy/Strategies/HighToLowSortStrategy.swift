public struct HighToLowSortStrategy: Strategy {
  public func sort<T: Comparable>(values: [T]) -> [T] {
    return values.sorted(by: >)
  }
}
