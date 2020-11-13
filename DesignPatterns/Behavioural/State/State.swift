enum State {
  case playing, paused
}

protocol MediaPlayerState {
  var player: MediaPlayer { get set }
  func start()
  func stop()
  func skip()
  func previous()
}

/*
 Add Another State - Offline
 */

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
