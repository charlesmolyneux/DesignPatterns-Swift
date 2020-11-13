import XCTest
@testable import DesignPatterns

class StateTests: XCTestCase {
  var mediaPlayer: MediaPlayer!
  var delegate: MediaPlayerDelegateStub!
  
  override func setUp() {
    super.setUp()
    mediaPlayer = MediaPlayer()
    delegate = MediaPlayerDelegateStub()
    mediaPlayer.delegate = delegate
  }
  
  func test_mediaPlayerDefaultsToPausedState() {
    XCTAssertTrue(mediaPlayer.state is PausedState)
  }

  func test_whenStateIsPaused_pressPlay_stateIsPlaying() {
    mediaPlayer.play()
    XCTAssertTrue(mediaPlayer.state is PlayingState)
  }
  
  func test_whenMediaPlayerIsAlreadyPlaying_PlayTappedAgain_thenStateIsPaused() {
    mediaPlayer.play()
    mediaPlayer.play()
    XCTAssertTrue(mediaPlayer.state is PausedState)
    XCTAssertEqual(delegate.startPlaybackCallCount, 1)
    XCTAssertEqual(delegate.stopPlaybackCallCount, 1)
  }
  
  func test_callingNextTrackCallsExpectedDelegates() {
    mediaPlayer.nextTrack()
    XCTAssertEqual(delegate.nextTrackCallCount, 1)
  }
  
  func test_callingPreviousTrackCallsExpectedDelegates() {
    mediaPlayer.previousTrack()
    XCTAssertEqual(delegate.previousTrackCallCount, 1)
  }
}

class MediaPlayerDelegateStub: MediaPlayerDelegate {
  var startPlaybackCallCount = 0
  var stopPlaybackCallCount = 0
  var nextTrackCallCount = 0
  var previousTrackCallCount = 0

  func startPlayback() {
    startPlaybackCallCount += 1
  }
  
  func stopPlayback() {
    stopPlaybackCallCount += 1
  }
  
  func nextTrack() {
    nextTrackCallCount += 1
  }
  
  func previousTrack() {
    previousTrackCallCount += 1
  }
}
