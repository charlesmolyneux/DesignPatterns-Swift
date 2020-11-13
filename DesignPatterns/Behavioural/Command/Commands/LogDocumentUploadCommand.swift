class LogDocumentUploadCommand: Command {
  private let logger: AnalyticsLogger
  private let count: Int
  
  public init(logger: AnalyticsLogger, count: Int) {
    self.logger = logger
    self.count = count
  }
  
  func execute() -> Result<Bool, Error> {
    logger.log(numberOfFiles: count)
    return .success(true)
  }
  
  func undo() -> Result<Bool, Error> {
    return .success(true)
  }
}
