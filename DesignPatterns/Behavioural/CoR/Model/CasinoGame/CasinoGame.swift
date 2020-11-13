public protocol CasinoGame {
  var gameId: String { get }
  var costPerPlay: Int { get }
  var displayName: String { get }
}
