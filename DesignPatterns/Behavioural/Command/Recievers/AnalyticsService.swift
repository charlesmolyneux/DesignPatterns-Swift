public protocol AnalyticsLogger {
  func log(numberOfFiles: Int)
  func log(event: String)
}

public class FireBaseLogger: AnalyticsLogger {
  public init() { }
  
  public func log(numberOfFiles: Int) {
    //connect to firebase and fire an event
  }
  
  public func log(event: String) {
    //connect to firebase and fire an event
  }
}
