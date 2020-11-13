class DecoratorAppExample {
  func execute(component: StringFormatter) -> String {
    return component.operation()
  }
  
  func apply(formatter: StringFormatter) -> String {
    formatter.operation()
  }
}
