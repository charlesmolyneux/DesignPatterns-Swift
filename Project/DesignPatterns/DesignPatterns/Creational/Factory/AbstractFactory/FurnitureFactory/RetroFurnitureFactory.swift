public struct RetroFurnitureFactory: AbstractFactory {
  public init() { }
  public func createChair() -> Chair {
    return RetroChair()
  }
  
  public func createTable() -> Table {
    return RetroTable()
  }
}
