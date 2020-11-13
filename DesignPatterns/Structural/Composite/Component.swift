//MARK - Base Component. This is an interface which declares common properties/functions
protocol Component {
  //(Optional) Base Component can provide methods for setting and removing a parent in the structure
  var parent: Component? { get set }
  
  //(Optional) Can define the child-management functions here. Although they'll be empty in the lead node component.
  func remove(component: Component)
  func add(component: Component)
  
  //(Optional) A method that lets the client code figure out whether a component can have children.
  func isComposite() -> Bool
  
  //The base Componentcan provide some default behavior or leave it to concrete classes.
  func operation() -> Int
}

//MARK - Component default implementations
extension Component {
  func add(component: Component) {}
  func remove(component: Component) {}
  func isComposite() -> Bool { false }
}
