struct OfflineState: MediaPlayerState {
  var player: MediaPlayer
  
  public init(player: MediaPlayer) {
    self.player = player
  }
  
  func start() {
    guard isAvailableOffline(media: Data()) else {
      return displayOfflineAlert()
    }
    
    player.startPlayback()
  }
  
  func stop() {
    player.stopPlayback()
  }
  
  func skip() {
    player.nextTrack()
  }
  
  func previous() {
    player.previousTrack()
  }
  
  private func displayOfflineAlert() {
    player.displayOfflineAlert()
  }
  
  private func isAvailableOffline(media: Data) -> Bool {
    //Check if track/video is downloaded to device if true, continue
    return true
  }
}
