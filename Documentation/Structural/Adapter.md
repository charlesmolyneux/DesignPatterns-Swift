

## Adapter - Creational
**Aliases:
Wrapper**
## Summary
The **Adapter Pattern** allows us to use objects with incompatible interfaces.
This problem may arise when we need to use a 3rd party library which we have no control over, however our client cannot modify the incompatible libraries source code.

The **Adapter Pattern** is shares some similarities to the [Proxy](https://github.com/charlesmolyneux/DesignPatterns-Swift/blob/master/Documentation/Structural/Proxy.md) pattern. A key difference being that the Proxy Pattern uses the same interface throughout.

### Pattern Objective
Allow us to use incompatible frameworks/classes without modifying existing code.

This pattern can also be used to promote reuse between subclasses. This can occur when a number of incompatible subclasses need to share some common functionality or behaviours. Rather than creating yet another subclass we can put this behaviour/functionality into an adapter object and wrap our objects with this new adapter dynamically.
##

#### Example
You have a highly addictive new game called, *'Mildly Tempered Birds'*. The app works entirely with JSON. As the game becomes more and more of a success you decide to add better analytics tracking.

You decide the best fit *(for some reason...)* is a 3rd Party Library that expects data to be in an XML Format. As you have no control over the 3rd Party Library and don't want to risk breaking something so it accepts JSON. You decide the best course of action is to create an 'Adapter'. This Adapter will then transform your JSON into XML and communicate with the incompatible service.

**Pseudo Code**
```
//Clients Shared Interface
public protocol MildTemperedBirdsAnalytics {
  func logEvent(_ event: GameEvent)
}

//Client
public class MildTemperedBirdsGame {
 private let analytics: MildTemperedBirdsAnalytics
 func logEvent(_ event: GameEvent) {
	analytics.logEvent(event)
 }
}

//Adapter
public class MildTemperedBirdsAnalyticsAdapter: MildTemperedBirdsAnalytics {

private let analytics: 3rdPartyAnalyticsLibrary

 func logEvent(_ event: GameEvent) {
	//Transform Object into XML
	analytics.log(xmlData: transformedObject)
 }
}

//Incompatiable Libraries Interface (To be Wrapped by our Adapter)
public protocol 3rdPartyAnalyticsLibrary {
  func log(xmlData: XML)
}

```

**PROS**
 - [x] OCP: Can introduce new types of adapters easily without breaking existing code.
 - [x] SRP: Can separate the interface/data conversion of code from the business logic.

**CONS**
- Can increase  overall app complexity by introducing new interfaces and classes.
- Sometimes the simpler solution is to just change the service class to match existing code.
