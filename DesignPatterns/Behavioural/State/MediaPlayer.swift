public protocol MediaPlayerDelegate: AnyObject {
  func startPlayback()
  func stopPlayback()
  func nextTrack()
  func previousTrack()
}

class MediaPlayer {
  var state: MediaPlayerState!
  public weak var delegate: MediaPlayerDelegate?
  
  public init() {
    self.state = PausedState(player: self)
  }
  
  func update(state: MediaPlayerState) {
    self.state = state
  }
  
  //UI
  func playTapped() {
    state.start()
  }
  
  func pauseTapped() {
    state.stop()
  }
  
  func previousTapped() {
    state.previous()
  }
  
  func nextTapped() {
    state.skip()
  }
  
  //Additional methods which State can call
  func startPlayback() {
    delegate?.startPlayback()
  }
  
  func stopPlayback() {
    delegate?.stopPlayback()
  }
  
  func nextTrack() {
    delegate?.nextTrack()
  }
  
  func previousTrack() {
    delegate?.previousTrack()
  }
}
