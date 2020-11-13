public class MediaPlayerViewController: MediaPlayerOfflineDelegate {
  private let player = MediaPlayer()
  
  public init() {
    player.offlineDelegate = self
  }
  
  //@IBAction
  func playTapped() {
    player.play()
  }
  
  //@IBAction
  func pauseTapped() {
    player.pause()
  }
  
  //@IBAction
  func previousTapped() {
    player.previous()
  }
  
  //@IBAction
  func nextTapped() {
    player.next()
  }
  
  public func displayOfflineAlert() {
    //Mark Display Offline Alert
  }
}
