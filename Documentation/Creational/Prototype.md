
## Prototype - Creational
**Aliases:
Clone**

## Summary
The **Prototype** pattern allows us to copy existing objects without making your code dependent on those classes.

### [View Code Example](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Creational/Prototype)

### Pattern Objective
The **Prototype** pattern is used to avoid subclassing object creators (such as the [Factory Method](https://github.com/charlesmolyneux/DesignPatterns-Swift/blob/master/Documentation/Creational/Factory.md) does).
 It also aims to reduce the cost of creating new objects in the standard way.

We are able to use a set of pre-built objects as prototypes, each of these objects may be configured differently. Rather than having subclasses which match these configurations we can just clone the appropriate prototype.
##

**PROS**
 - [x] Removes repeated initialisation in favour of cloning pre-build prototypes.
 - [x] Can use instead of inheritance when dealing with configuration presets.
 - [x] Allows cloning of objects without coupling to their concrete class.
 - [x] Can clone (copy) complex objects more conveniently.

**CONS**
- Can end up with circular references when cloning objects with a greater complexity.
