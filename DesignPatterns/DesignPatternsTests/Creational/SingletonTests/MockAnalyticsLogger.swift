import DesignPatterns

class MockAnalyticsLogger: AnalyticsLogger {
  var loggedEvents: [String] = []
  
  func log(event: String) {
    loggedEvents.append(event)
  }
  
  func log(numberOfFiles: Int) {  }
}
