struct PausedState: MediaPlayerState {
  var player: MediaPlayer
  
  public init(player: MediaPlayer) {
    self.player = player
  }
  
  func start() {
    player.startPlayback()
    player.update(state: PlayingState(player: player))
  }
  
  func stop() { }
  
  func skip() {
    player.nextTrack()
  }
  
  func previous() {
    player.previousTrack()
  }
}
