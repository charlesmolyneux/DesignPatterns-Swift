import DesignPatterns

class MockAnalyticsLogger: AnalyticsService {
  var loggedEvents: [String] = []
  
  func log(event: String) {
    loggedEvents.append(event)
  }
  
  func log(numberOfFiles: Int) {  }
}
