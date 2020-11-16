

## Visitor - Behavioural

## Summary
The **Visitor Pattern** provides a method for us to separate algorithms from the objects on which they perform on.

### Pattern Objective
The Visitor Pattern encourages the separation of concerns by extracting algorithms (or operations) from objects. This allows us to add new operations to existing objects without breaking too much of our code / needing to modify the existing object.

This pattern also cleans up classes. This is achieved by allowing classes to be more focused on their singular 'main' job whilst additional auxiliary behaviours are extracted into their own 'visitor' classes.

**Pseudo Code**
```
protocol  MathComponent {
	func accept(_ visitor: Visitor) -> Int
}

//Concrete 'component'. Implements the 'accept' method so it calls the correct visitor method.
struct  IntegerValueComponent: MathComponent {
	let  myValue: Int

	public init(_ value: Int) {
		self.myValue = value
	}

	func accept(_ visitor: Visitor) -> Int  {
		return visitor.visitIntergerValueComponent(element: self)
	}
}

struct  StringValueComponent: MathComponent {
	let myValue: String = "10"

	func accept(_ visitor: Visitor) -> Int {
		return visitor.visitStringValueComponent(element: self)
	}
}

/*
The Visitor should declare a set of methods for visiting component classes.
It is good practice for the method signature of the visiting method to match the components class it's working with.
*/

protocol  Visitor {
	func  visitIntergerValueComponent(element: IntegerValueComponent) -> Int
	func  visitStringValueComponent(element: StringValueComponent) -> Int
}


/*'Concrete Visitor' implementations.
These implement the same alogirithim many times,
ensuring each concrete component class can be worked with.
*/

class  MultiplierVisitor: Visitor {
	func  visitIntergerValueComponent(element: IntegerValueComponent) -> Int {
		return element.myValue * element.myValue
	}

	func  visitStringValueComponent(element: StringValueComponent) -> Int {
		guard let value = Int(element.myValue) else { return 0 }
		return value * value
	}
}

class  AdditionVisitor: Visitor {
	func  visitIntergerValueComponent(element: IntegerValueComponent) -> Int {
		return element.myValue + element.myValue
	}

	func  visitStringValueComponent(element: StringValueComponent) -> Int {
		guard let value = Int(element.myValue) else { return 0 }
		return value + value
	}
}

class  MyApplication {
	func calculate(value: Int) -> Int {
		let visitor = MultiplierVisitor()
		let component = IntegerValueComponent(value)
		return component.accept(visitor)
	}
}
```
##

**PROS**
 - [x] SRP: Extract possibly duplicated behaviours into a singular class.
 - [x] OCP: Can introduce new behaviours that can work on multiple objects of varying class types, without changing the classes themselves.
 - [x] Allow you to perform operations on complex object/tree structures by applying the visitor to each object within the structure.

**CONS**
 -  Can have issues with `private` fields/access to variables they're required to work with (when extracting).
