# Command - Behavioural
**Aliases:
 Action, Transaction**

## Summary
Command turns 'requests' (or actions) into objects. These objects contain all the information they need to perform their request (or operation).

### [Code](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Behavioural/Command)

### Pattern Objective
The **Command** pattern seeks to separate concerns. In the example provided here it looks to separate the GUI and Business logic layers. This is achieved by extracting the UI objects (i.e. a Save/Undo/Redo buttons) logic into separate command objects that can trigger the request.

##

**PROS**
 - [x] SRP: Decouples classes, Separates classes which invoke operations from those that perform operations
 - [x] OCP: Can easily introduce new **commands** without breaking existing code
 - [x] Implement undo/redo as you store a list of performed operations.

**CONS**
 -  Overall app complexity may increase as you introduce new layers. *(minor)*
