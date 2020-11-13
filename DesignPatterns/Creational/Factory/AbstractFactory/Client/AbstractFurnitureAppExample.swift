public class AbstractFurnitureAppExample {
  let factory: AbstractFactory
  
  public init(_ factory: AbstractFactory) {
    self.factory = factory
  }
  
  public func create(item: FurnitureProductType) -> FurnitureProduct {
    switch item {
    case .chair:
      return factory.createChair()
    case .table:
      return factory.createTable()
    }
  }
}

