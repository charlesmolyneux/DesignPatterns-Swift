public class AnalyticsLoggerStore {
  static var cachedSearchResults: [String: EventTriggeredState] = [:]
  public static let shared = AnalyticsLoggerStore()
  
  private init() { }
  
  public static func clearCache() {
    cachedSearchResults.removeAll()
  }
  
  public func shouldFireEvent(with itemIdentifier: String) -> Bool {
    return AnalyticsLoggerStore.cachedSearchResults[itemIdentifier, default: .notSent] != .sent
  }
  
  public func updateCache(_ itemIdentifier: String) {
    AnalyticsLoggerStore.cachedSearchResults[itemIdentifier] = .sent
  }
  
  public enum EventTriggeredState {
    case sent, notSent
  }
}


