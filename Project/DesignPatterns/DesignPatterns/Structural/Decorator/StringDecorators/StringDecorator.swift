class StringDecorator: StringFormatter {
  private var formatter: StringFormatter
  
  init(_ formatter: StringFormatter) {
    self.formatter = formatter
  }
  
  //Decorator passes the work to the wrapped component (component here is the `formatter`) 
  func operation() -> String {
    return formatter.operation()
  }
}
