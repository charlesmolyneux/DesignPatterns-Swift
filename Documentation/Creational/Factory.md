

## Factory - Creational
**Aliases:
Virtual Constructor**

### [View Code Example](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Creational/Factory/FactoryExample)

## Summary
**Factory Method** replaces direct object creation with a factory method.


### Pattern Objective
**Factory Method** provides an interface for creating objects, allowing subclasses to decide which object should be instantiated. It allows for subclasses to decide how a parent object is creates and what type.

This is useful for when you cannot determine what type of object needs to be created in advance.
##

#### Example
You have an Arcade Game, 'Monsters Attack'. You decide to add additional Monsters to your game. Adding in new Monsters should be easy, you can move their creation logic inside a 'Monster Factory'. Given all these objects share the same interface.

```
//The common interface between Objects
protocol Monster {
	func attack() -> Int
	func dialog() -> String
	var hitPoints: Int { get set }
}

//Concrete Object
struct Dragon: Monster {
  func attack() -> Int { 50}
  func dialog() -> String { "Roar?" }
  var hitPoints = 500
}

//Factory Implementation
public class MonsterFactory {
  public struct create(monster: MonsterType) -> Monster {
    switch monster {
      case .dragon: return Dragon()
      ...
      ...
    }
}
```

**PROS**
 - [x] SRP: Moves object creation code into one place.
 - [x] OCP: Can easily introduce add new objects/products without breaking existing code.
 - [x] Decouples concrete objects from the creator.

**CONS**
 -  Can end up with a large number of subclasses whilst implementing this pattern. This can increase overall complexity.


## Abstract Factory - Creational

### [Code](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Creational/Factory/AbstractFactory)

### Summary & Pattern Objective
The Abstract Family is similar to the Factory method. However, the **Abstract Factory** allows us to produce a family of related objects without specifying their concrete class.

The Abstract Factory provides a way for us to encapsulate a group of factories, each of which has a common theme.
In this example we're looking at a FurnitureFactory. The AbstractFactory does not know whether it will be creating Modern or Retro furniture using their respective Factories (ModernFurnitureFactory & RetroFurnitureFactory).

#### Example
You have an Arcade Game, 'Monsters Attack'. However, you have different variations of Monsters.
Sometimes you have 'Legendary Monster' types and 'Weakling Monster' types.

```
//Common Factory Interface
protocol AbstractMonsterFactory {
	func create(monster: MonsterType) -> Monster
}

class LegendaryMonsterFactory {
	func create(monster: MonsterType) -> Monster {
		switch monster {
		 case .dragon:
		   return LegendaryDragon()
		   ...
		   ...
       }
   }
}

class WeakMonsterFactory {
	func create(monster: MonsterType) -> Monster {
		switch monster {
		 case .dragon:
		   return NewtLizard()
		   ...
		   ...
	  }
   }
}

class MonsterGameApp {
	var factory: AbstractMonsterFactory

	func update(_ factory: AbstractMonsterFactory) {
		self.factory = factory
	}

	func conjure(monster: MonsterType) -> Monster {
	  return factory.conjure(monster)
	}

```

**PROS**
 - [x] SRP: Moves object creation code into one place.
 - [x] OCP: Can easily introduce add new objects/products without breaking existing code.
 - [x] Decouples concrete objects from the creator.
 - [x] Ensures compatiability between the objects you're creating.

**CONS**
 -  Can end up with a large number of subclasses whilst implementing this pattern. This can increase overall complexity.
