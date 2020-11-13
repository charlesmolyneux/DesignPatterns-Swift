protocol Command {
  @discardableResult func execute() -> Result<Bool, Error>
  @discardableResult func undo() -> Result<Bool, Error>
}
