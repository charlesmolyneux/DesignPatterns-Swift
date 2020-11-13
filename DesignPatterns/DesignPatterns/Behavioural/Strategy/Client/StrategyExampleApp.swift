public class StrategyExampleApp {
  private let sorter: Sorter
  
  public init(sorter: Sorter) {
    self.sorter = sorter
  }
  
  public func sort(numbers: [Int]) -> [Int] {
    sorter.sort(values: numbers)
  }
  
  public func sort(strings: [String]) -> [String] {
    sorter.sort(values: strings)
  }
  
  public func update(_ strategy: Strategy) {
    sorter.update(strategy)
  }
}
