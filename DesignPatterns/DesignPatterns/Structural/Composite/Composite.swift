/*
 The Composite Class represents the complex components that may or may not have children.
 The composite class delegates the work to their children and then sums-up the result
 */

/*
  Rename - Branch(?)
 */
class Composite: Component {
  var parent: Component?
  
  private var children: [Component] = []
  
  func add(component: Component) {
    var child = component
    child.parent = self
    children.append(child)
  }
  
  func remove(component: Component) {
    //Find Item then Remove from Array
  }
  
  func isComposite() -> Bool {
    return true
  }
  
  func operation() -> Int {
    let result = children.reduce(0) { result, nextResult in
      return result + nextResult.operation()
    }
    
    return result
  }
}
