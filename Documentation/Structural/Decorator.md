

# Decorator - Creational
**Aliases:
Wrapper**
## Summary
The Decorator Pattern provides a method for us to attach new behaviours to objects by placing objects inside 'wrapper' objects which contain additional behaviours.

### Pattern Objective
Provide a method to dynamically add additional behaviours to an object without affecting the behaviour of objects of the same class. This pattern helps us to adhere to the Single Responsibility Principle (SRP).

**PROS**
 - [x] Extend an object's behaviour without making new subclasses.
 - [x] We can add and remove behaviours as required from objects at runtime.
 - [x] Can combine multiple behaviours by wrapping an object inside multiple 'decorators'
 - [x] SRP: Divide up monolithic classes into small classes with individual behaviours.

**CONS**
- Difficult to implement a decorators in a way that its behaviour doesn't depend on the decorators in the stack
