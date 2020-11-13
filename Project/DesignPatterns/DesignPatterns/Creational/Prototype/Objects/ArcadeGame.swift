import Foundation

public class ArcadeGame: NSCopying {
  private let displayName: String
  private let dateProvider: DateProvider
  
  private weak var player: ArcadeGameUser?
  private(set) public var highScores = [ArcadeGameHighScore]()
  
  public init(displayName: String,
              player: ArcadeGameUser?,
              highScores: [ArcadeGameHighScore],
              dateProvider: DateProvider = DefaultDateProvider()) {
    self.displayName = displayName
    self.player = player
    self.highScores = highScores
    self.dateProvider = dateProvider
    player?.add(game: self)
  }
  

  public func didFinishGameWith(score: Int) {
    highScores.append(ArcadeGameHighScore(score: score,
                                          date: dateProvider.currentDate,
                                          playerName: player?.playerDisplayName))
  }
  
  public func copy(with zone: NSZone? = nil) -> Any {
    return ArcadeGame(displayName: displayName, player: player, highScores: highScores, dateProvider: dateProvider)
  }
}
