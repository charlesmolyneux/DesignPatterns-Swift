# Singleton - Creational

### [View Code Example](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Creational/Singleton)

## Summary
Singletons let you ensure that a class has only one instance and provides a global access point to this instance.

### Pattern Objective
1. Helps enforce when your program should only have a single instance of a particular class available to all clients.
2. Provides a method of adding stricter control over global variables.
##

**PROS**
 - [x] Ensures a class has only a single instance.
 - [x] Global access point to that instance.
 - [x] Object only initialised when it's requested.

**CONS**
- Can become a [god-object](https://en.wikipedia.org/wiki/God_object)
- Violates the SRP.
- Singletons can mask bad design. e.g. components can know too much about each other.
- Beware multi-threading. Must make sure multiple threads do not create a singleton object 'x' times.
- Can increase unit testing complexity. May need a creative solution for mocking the singleton.

Note:
*[god-object](https://en.wikipedia.org/wiki/God_object) - an object that knows too much or does too much.
The God object is an example of an anti-pattern*.
*[Anti-pattern](https://en.wikipedia.org/wiki/Anti-pattern) - A common response to a recurring problem that is usually ineffective/counter productive
