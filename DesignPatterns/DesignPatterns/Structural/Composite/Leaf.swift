/*
 Leaf can't have any children, this represents the end of an objects composition
 Leaf objects tend to do most the work.
 Composite objects tend to delegate to their sub-components
 */
struct Leaf: Component {
  var parent: Component?
  
  func operation() -> Int {
    return 5
  }
}
