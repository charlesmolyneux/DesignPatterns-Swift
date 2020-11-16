protocol MathComponent {
  func accept(_ visitor: Visitor) -> Int
}

struct IntegerValueComponent: MathComponent {
  let myValue: Int
  
  public init(_ value: Int) {
    self.myValue = value
  }
  
  func accept(_ visitor: Visitor) -> Int  {
    return visitor.visitIntergerValueComponent(element: self)
  }
}

struct StringValueComponent: MathComponent {
  let myValue: String = "10"

  func accept(_ visitor: Visitor) -> Int {
    return visitor.visitStringValueComponent(element: self)
  }
}

/*
The Visitor should declare a set of methods for visiting component classes.
It is good practice for the method signature of the visiting method to match the components class it's working with.
*/
protocol Visitor {
  func visitIntergerValueComponent(element: IntegerValueComponent) -> Int
  func visitStringValueComponent(element: StringValueComponent) -> Int
}

class MultiplierVisitor: Visitor {
    func visitIntergerValueComponent(element: IntegerValueComponent) -> Int {
      return element.myValue * element.myValue
    }
    
    func visitStringValueComponent(element: StringValueComponent) -> Int {
      guard let value = Int(element.myValue) else { return 0 }
      return value * value
    }
}

class MyApplication {
  func calculate(value: Int) -> Int {
    let visitor = MultiplierVisitor()
    let component = IntegerValueComponent(value)
    return component.accept(visitor)
  }
}
