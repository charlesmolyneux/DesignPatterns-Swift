public class ArcadeGameUser {
  public let playerDisplayName: String
  private var playedGames: [ArcadeGame] = []
  public var totalGamesPlayed: Int { playedGames.count }

  public init(playerDisplayName: String) {
    self.playerDisplayName = playerDisplayName
  }
  
  public func add(game: ArcadeGame) {
    playedGames.append(game)
  }
}
