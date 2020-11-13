import XCTest
import DesignPatterns

class GameProviderPrototype: XCTestCase {
  func test_prototypeRealWorld() {
    let player = ArcadeGameUser(playerDisplayName: "Mkodo")
    let game = ArcadeGame(displayName: "Space Invaders",
                          player: player,
                          highScores: [],
                          dateProvider: ArcadeMockDateProvider())
    
    game.didFinishGameWith(score: 1000)

    XCTAssertEqual(player.totalGamesPlayed, 1)
    
    guard let gameCopy = game.copy() as? ArcadeGame else {
      return XCTFail("Game was not copied")
    }
    
    XCTAssertEqual(game.highScores.count, 1)
    XCTAssertEqual(game.highScores[0].score, 1000)
    XCTAssertEqual(player.totalGamesPlayed, 2)
    
    gameCopy.didFinishGameWith(score: 100)
    XCTAssertEqual(gameCopy.highScores.count, 2)
  }
}

class ArcadeMockDateProvider: DateProvider {
  var currentDate: Date {
    return Date()
  }
}
