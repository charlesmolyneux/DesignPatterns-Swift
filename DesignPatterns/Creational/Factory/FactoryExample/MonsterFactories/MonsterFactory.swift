protocol MonsterFactory {
  func conjure(monster: MonsterType) -> Monster
}

class DefaultMonsterFactory: MonsterFactory {
  public init() { }
  
  func conjure(monster: MonsterType) -> Monster {
    switch monster {
    case .dinosaur:
      return TRex()
    case .dragon:
      return Dragon()
    case .snake:
      return Snake()
    }
  }
}

enum MonsterType {
  case dragon, snake, dinosaur
}
