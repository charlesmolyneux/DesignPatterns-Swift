public protocol AnalyticsService {
  func log(numberOfFiles: Int)
  func log(event: String)
}

public class FirebaseAnalyticsService: AnalyticsService {
  public init() { }
  
  public func log(numberOfFiles: Int) {
    //connect to firebase and fire an event
  }
  
  public func log(event: String) {
    //connect to firebase and fire an event
  }
}
