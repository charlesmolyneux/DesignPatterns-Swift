public protocol AbstractFactory {
  func createChair() -> Chair
  func createTable() -> Table
}
