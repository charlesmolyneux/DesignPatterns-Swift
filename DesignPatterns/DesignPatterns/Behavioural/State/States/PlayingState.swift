struct PlayingState: MediaPlayerState {
  var player: MediaPlayer
  
  public init(player: MediaPlayer) {
    self.player = player
  }
  
  func start() {
    stop()
  }
  
  func stop() {
    player.stopPlayback()
    player.update(state: PausedState(player: player))
  }
  
  func skip() {
    player.nextTrack()
  }
  
  func previous() {
    player.previousTrack()
  }
}
