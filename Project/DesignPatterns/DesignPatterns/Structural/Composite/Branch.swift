class Branch: Component {
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
