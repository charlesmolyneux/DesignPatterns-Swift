# Chain Of Responsibility - Behavioural
**Aliases: CoR, Chain of Command, Chain of Responsibility**

## Summary
Chain of Responsibility (CoR) allows us to pass requests along a chain of handlers.
The handler decides whether to process the request or to pass it along the chain.

### [Code](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Behavioural/CoR)

### Pattern Objective
CoR relies on transforming behaviours into stand-alone objects (*handlers*).
Each handler is a single class with a single method to perform the check. Handlers are linked together as a chain, with each handler having a reference to the next one along the chain.

The handler will receive a request and then decide whether or not it should be processed or passed onto the next handler.

**PROS**
 - [x] SRP: Decouples classes, Separates classes which invoke operations from those that perform operations
 - [x] OCP: Can easily introduce new handlers without breaking existing code
 - [x] Can change ordering of requests and which handlers to use during runtime.

**CONS**
 -  Can end up with unhandled requests
