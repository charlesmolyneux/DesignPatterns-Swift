# Observer - Behavioural
**Aliases:
Event-Subscriber, Listener**

### [View Code Example](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Behavioural/Observer)

## Summary
   The **Observer** Pattern lets you define a subscription mechanism to notify 'n' objects about events these objects are observing.

The Observer pattern is best used when there is a one-to-many relationship to an object that may be regularly modified (i.e. Cart Balance).

##### Examples
  - A Games Console is out of stock on a website, users can subscribe to be notified about stock changes.
 - A User deposits money into their account, a balance textfield observes changes to the balance amount and gets notified of these changes and re-displays.

### Pattern Objective
The Observer pattern aims to make notifying objects that are all interested in another objects state/value. It aims to
**PROS**
 - [x] SRP: Establishes relationships between objects at runtime.
 - [x] OCP: Can easily introduce new subscriber classes without having to change the publishers code.

**CONS**
 -  Subscribers are notified in random order
