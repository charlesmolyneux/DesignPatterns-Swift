# State - Behavioural

## Summary
 The **State** Pattern allows for objects to change its behaviour when its internal state changes.
 Each **State** can be its own class and contain the relevant State specific behaviour.

 ### [Code](https://github.com/charlesmolyneux/DesignPatterns-Swift/tree/master/Project/DesignPatterns/DesignPatterns/Behavioural/State)

##### Examples
  - A Video Game Character (NPC) might have a number of 'States'.
  -- Friendly, Hostile, Neutral or Deceased
  The players interaction (right click) might change depending on each of these states.

| State | Right Click Action  |
|--|--|
| Friendly  | Opens a Trade Window |
| Hostile | Auto Attack |
| Neutral | Opens an introduction Window |
| Deceased | Does Nothing |


### Pattern Objective
The **State** Pattern looks to encapsulate various behaviour for a single object. This is a cleaner way for an object to change its behaviour at runtime without littering your code with if, else or switch statements *(removing conditionals)*

**PROS**
 - [x] SRP: Can organise code related to particular states into their own classes.
 - [x] OCP: Can easily introduce new states without impacting the existing state classes/context.
 - [x] Simplifies the Context class by removing state conditional statements *(if, if else, else, switches)*.

**CONS**
 -  Can be overkill if a state machine has a few number of states or is not prone to change.
