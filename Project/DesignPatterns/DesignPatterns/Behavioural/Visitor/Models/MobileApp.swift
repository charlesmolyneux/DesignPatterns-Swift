public struct MobileApp {
  let appIdentifier: String
  let priority: AppPriority
  
  enum AppPriority {
    case veryHigh, high, low
  }
}
