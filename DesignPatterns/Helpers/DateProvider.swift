public protocol DateProvider {
  var currentDate: Date { get }
}

public struct DefaultDateProvider: DateProvider {
  public var currentDate: Date {
    return Date()
  }
  
  public init() { }
}
