

## Composite - Creational
**Aliases:
Object Tree**
## Summary
The **Composite Pattern** provides a mechanism for composing objects into a tree structure.
This allows us to work with this new 'tree object' as if it were a singular object.

### Pattern Objective
The **Composite Pattern** aims to simplify your client codes interaction with complex objects.

Your Client code will interact with the tree-structure via the components interface. The component interface aims to provide a singular and simple way for the client to work with both simple or complex elements in the tree without caring about their concrete classes.

**Pseudo Code**
```
//Component
//Methods available to both simple and complex elements in the tree

protocol Payroll {
	func calculatePayroll() -> Double
	...
}

//Leaf. A 'simple' component with no sub-elements. Does most the work, with nothing to delegate to.

struct Employee: Component {
	private let employeeId: String = //Some Value  
	private let monthlySalary: Dobule = 2000
	func calculatePayroll() -> Double { return monthlySalary * 12 }
}

//Container
//Can have sub-elements, either more containers or leaf objects.
//Delegates work to its subelements. Only works through the 'Component' (Payroll) interface.

struct Manager: Component {
	 private(set) var reportees: [Component] = []
	 func add(reportee: Component) { }
	 func remove(reportee: Component) { }

	func calculatePayroll() -> Double {
	  return reportees.reduce(0) { result, nextResult in
		return result + nextResult.calculatePayroll()
	  }
	}
}

```
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
