public struct BubbleSortStrategy: Strategy {
  public func sort<T: Comparable>(values: [T]) -> [T] {
    var sortedValues = values
    for i in 1..<sortedValues.count {
      for j in 0..<sortedValues.count-i where sortedValues[j] > sortedValues[j+1] {
        sortedValues.swapAt(j, j+1)
      }
    }
    
    return sortedValues
  }
}
