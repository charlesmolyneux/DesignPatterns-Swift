# Facade - Creational

### [View Code Example](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Structural/Facade)

## Summary
A **Facade** is used to provide a simplified interace, often to a library, framework or complex set of classes.

 **Facade** is similar to the [Adapter pattern](https://github.com/charlesmolyneux/DesignPatterns-Swift/blob/master/Documentation/Creational/Adapter.md). 
 The Adapter pattern aims to make an existing interface uable, wrapping a singular object. Whilst Facade defines a new interace for n+ existing objects to be used by the client.
 
 **Facade** is similar to the [Proxy pattern](https://github.com/charlesmolyneux/DesignPatterns-Swift/blob/master/Documentation/Creational/Proxy.md). 
 Both patterns aim to simplify a complex entity. However, whilst Proxy uses the same interface as it's service object the Facade defines its own new interface. 


### Example
Imagine a Video Conversion framework. This Framework has many different dependencies (class dependencies).
Instead of making your code work directly with these classes you can create a Facade class to encapsulate the functionality you need and to hide away the rest.
##

**PROS**
 - [x] Can isolate your code from complexity of a subsystem

**CONS**
- A Facade can become a 'God Object*' coupled to many/all classes of an app.

Note:
*[god-object](https://en.wikipedia.org/wiki/God_object) - an object that knows too much or does too much.
The God object is an example of an anti-pattern*.
*[Anti-pattern](https://en.wikipedia.org/wiki/Anti-pattern) - A common response to a recurring problem that is usually ineffective/counter productive
