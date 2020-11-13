public protocol FurnitureProduct {
  var price: Double { get }
}

public protocol Chair: FurnitureProduct {
  var legCount: Int { get }
  var primaryMaterial: Material { get }
}

public protocol Table: FurnitureProduct {
  var width: Int { get }
  var height: Int { get }
  var primaryMaterial: Material { get }
  var canFold: Bool { get }
}

public enum Material {
  case oak, yew, metal, plastic
}

public enum FurnitureProductType {
  case chair, table
}
