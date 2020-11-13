# Strategy - Behavioural

## Summary
The Strategy Pattern allows you to divide a group of related algorithms so each algorithm has its own separate class. The client can then determine which algorithm to use and change as necessary.

### Pattern Objective
Th Strategy Pattern looks to separate related algorithms into their own class and move them outside of the class *(context)* that uses them to perform a task.

This pattern will help break monolithic classes with too many responsibilities / algorithms so the client is only aware of the strategy it needs at that point.

#### Example
You have a basic calculator application with a number of functions, Multiply, Divide, Subtract and Add.
You can split the behaviour for Adding, Subtracting, Dividing and Multiplying into their own classes each of which conforms to the same protocol.

```
//The Strategy Protocol
public protocol CalculatorMethod {
  func perform(_ val1: Double, val2: Double) -> Double
}

//A Strategy Implementation
public struct AddOperation: Calculator {
 func perform(_ val1: Double, _ val2: Double) -> Double {
	return val1 + val2
 }
}

//The Client
class CalculatorApp {
 var strategy: CalculatorMethod
public func update(strategy: CalculatorMethod) {
 self.strategy = strategy
}

public performCalculation(firstValue: Double, secondValue: Double) {
 print(stratey.perform(firstValue, secondValue))
}
```

##

**PROS**
 - [x] OCP: Can easily introduce new strategies into the app without breaking existing code.
 - [x] Can swap strategies *(algorithms)* out during runtime.
 - [x] Isolates implementation details from the code that uses it, (moves business logic away from ui).

**CONS**
 -  Ensure clients/consumers/end-users are aware of the different strategies available to them so they can select appropriately.
 - Only really use when you have a number of algorithms that can change frequently. There's a risk of overcomplicating your code.
