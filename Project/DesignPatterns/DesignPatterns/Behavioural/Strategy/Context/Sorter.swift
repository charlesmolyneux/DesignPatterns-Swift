public class Sorter {
  private var strategy: Strategy
  
  public init(_ strategy: Strategy) {
    self.strategy = strategy
  }
  
  public func update(_ strategy: Strategy) {
    self.strategy = strategy
  }
  
  public func sort<T: Comparable>(values: [T]) -> [T] {
    return strategy.sort(values: values)
  }
}
