class UppercasedStringDecorator: StringDecorator {
  override func operation() -> String {
    return super.operation().uppercased()
  }
}
