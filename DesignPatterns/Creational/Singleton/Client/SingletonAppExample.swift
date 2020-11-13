class ArcadeListView {
  let analytics: ArcadeAnalyticsLogger
  
  public init(analytics: ArcadeAnalyticsLogger) {
    self.analytics = analytics
  }
  
  public func didScroll(to gameDisplayName: String) {
    analytics.logScreenEvent(with: gameDisplayName)
  }
}

class ArcadeFilteredListView {
  let analytics: ArcadeAnalyticsLogger
  
  public init(analytics: ArcadeAnalyticsLogger) {
    self.analytics = analytics
  }
  
  func didScroll(to gameDisplayName: String) {
    analytics.logScreenEvent(with: gameDisplayName)
  }
}

public class ArcadeAnalyticsLogger {
  private let logger: AnalyticsLogger
  let shared = AnalyticsLoggerStore.shared

  public init(logger: AnalyticsLogger) {
    self.logger = logger
  }
  
  public func logScreenEvent(with identifier: String) {
    guard shared.shouldFireEvent(with: identifier) else {
      return
    }
    
    shared.updateCache(identifier)
    logger.log(event: "\(identifier) was displayed on screen")
  }
}
