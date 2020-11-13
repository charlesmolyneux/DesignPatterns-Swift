class ReverseStringDecorator: StringDecorator {
  override func operation() -> String {
    return String(super.operation().reversed())
  }
}
