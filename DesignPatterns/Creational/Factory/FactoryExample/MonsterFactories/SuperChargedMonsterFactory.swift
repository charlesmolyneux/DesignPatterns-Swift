class SuperChargedMonsterFactory: MonsterFactory {
  func conjure(monster: MonsterType) -> Monster {
    switch monster {
    case .dinosaur, .dragon, .snake:
      return DinoDragonSnake()
    }
  }
}
