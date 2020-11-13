public protocol MediaPlayerDelegate: AnyObject {
  func startPlayback()
  func stopPlayback()
  func nextTrack()
  func previousTrack()
}

public protocol MediaPlayerOfflineDelegate: AnyObject {
  func displayOfflineAlert()
}

class MediaPlayer {
  private(set) var state: MediaPlayerState!
  public weak var delegate: MediaPlayerDelegate?
  public weak var offlineDelegate: MediaPlayerOfflineDelegate?
  
  public init() {
    self.state = PausedState(player: self)
  }
  
  func update(state: MediaPlayerState) {
    self.state = state
  }
  
  func play() {
    state.start()
  }
  
  func pause() {
    state.stop()
  }
  
  func previous() {
    state.previous()
  }
  
  func next() {
    state.skip()
  }
  
  /*
   The states can call these 'service methods' to do additional tasks (fetch more tracks, pause stream)
   */
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
  
  func displayOfflineAlert() {
    offlineDelegate?.displayOfflineAlert()
  }
}
