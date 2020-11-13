protocol MediaPlayerState {
  var player: MediaPlayer { get set }
  func start()
  func stop()
  func skip()
  func previous()
}
