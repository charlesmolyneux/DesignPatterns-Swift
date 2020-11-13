

## Composite - Creational
**Aliases:
Object Tree**
## Summary
The Composite Pattern provides a mechanism for composing objects into a tree structure, you can then work with this 'tree' structure as if it were a singular object.

### Pattern Objective
##

#### Example
You have a payroll application. Your business has a number of managers and a number of developers and QAs. Each object (Manager, Developer and QA) conform to the 'Employee' protocol. A Manager may have 1 or more Developers and 0 or more QAs, some Managers may have Managers of their own.

To total up the entire salary we can compose an object tree with these different objects that share a common interface (Employee).

The composite (tree) class can then iterate through its branches and leaf nodes and sum up the total salary.

**PROS**
 - [x] Can work with complex tree structures more conveniently.
 - [x] OCP: Can introduce new element types without breaking existing code. (i.e. Sales Manager, Sales)

**CONS**
- Can be difficult to provide a common interface for a classes whose functionality differs too greatly
