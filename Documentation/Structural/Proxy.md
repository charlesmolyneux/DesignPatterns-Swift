
# Proxy - Creational
### [View Code Example](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Structural/Proxy)

## Summary
The Proxy Pattern allows us to restrict access control to another object, as well as being a placeholder for another object.

By Proxy classes acting as a placeholder for another class we can before operations prior or post a request reaching the original object.  

The Proxy Pattern is similar to the [Adapter pattern](https://github.com/charlesmolyneux/DesignPatterns-Swift/blob/master/Documentation/Structural/Adapter.md), the key difference being the Proxy pattern shares the same interface as the class it's acting as a placeholder for. 

**Proxy** is similar to the [Facade pattern](https://github.com/charlesmolyneux/DesignPatterns-Swift/blob/master/Documentation/Structural/Facade.md). 
Both patterns aim to simplify a complex entity. However, Proxy uses the **same interface** as it's service object . Whilst Facade defines its own new interface. 


### Pattern Objective
Provide a mechanism for controlling access, especially useful when you only want clients to be able to use specific parts of a service object. (protection proxy)
Can be used to log networking/requests to the service objects (logging proxy).
Can be used to cache responses from the service. (caching proxy).
Can be used to chain multiple requests together without the client being aware, processing results as it goes.

##

**PROS**
 - [x] Can control service objects without the client knowing
 - [x] Provide better management of service objects lifecycle, without clients knowing. 
 - [x] Allows you to begin development even if the service object is unavailable yet
 - [x] OCP: Introduce new proxies without changing the service or clients (benefit of sharing same interface) 

**CONS**
- Code may increase in complexity as you introduce additional classes/layers.
- Can slow down response from services as they interact with another layer.
