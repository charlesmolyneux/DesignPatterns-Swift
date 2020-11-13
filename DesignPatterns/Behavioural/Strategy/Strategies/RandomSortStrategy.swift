public struct RandomSort: Strategy {
  public func sort<T>(values: [T]) -> [T] {
    return values.shuffled()
  }
}
