
# Factory - Creational
**Aliases:
Virtual Constructor**

## Summary
**Factory Method** replaces direct object creation with a factory method.

### Pattern Objective
**Factory Method** provides an interface for creating objects, allowing subclasses to decide which object should be instantiated. It allows for subclasses to decide how a parent object is creates and what type.

This is useful for when you cannot determine what type of object needs to be created in advance.
##

**PROS**
 - [x] SRP: Moves object creation code into one place.
 - [x] OCP: Can easily introduce add new objects/products without breaking existing code.
 - [x] Decouples concrete objects from the creator.

**CONS**
 -  Can end up with a large number of subclasses whilst implementing this pattern. This can increase overall complexity.


# Abstract Factory - Creational

### Summary & Pattern Objective
The Abstract Family is similar to the Factory method. However, the **Abstract Factory** allows us to produce a family of related objects without specifying their concrete class.

The Abstract Factory provides a way for us to encapsulate a group of factories, each of which has a common theme.
In this example we're looking at a FurnitureFactory. The AbstractFactory does not know whether it will be creating Modern or Retro furniture using their respective Factories (ModernFurnitureFactory & RetroFurnitureFactory).

**PROS**
 - [x] SRP: Moves object creation code into one place.
 - [x] OCP: Can easily introduce add new objects/products without breaking existing code.
 - [x] Decouples concrete objects from the creator.
 - [x] Ensures compatiability between the objects you're creating.

**CONS**
 -  Can end up with a large number of subclasses whilst implementing this pattern. This can increase overall complexity.
