class FactoryAppExample {
  private let factory: MonsterFactory
  
  public init(factory: MonsterFactory) {
    self.factory = factory
  }
  
  func attackWith(monster: MonsterType) -> Int {
    return factory.conjure(monster: monster).attack()
  }
}
