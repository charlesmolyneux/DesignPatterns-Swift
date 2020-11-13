public struct ModernFurnitureFactory: AbstractFactory {
  public init() { }

  public func createChair() -> Chair {
    return ModernChair()
  }
  
  public func createTable() -> Table {
    return ModernTable()
  }
}
