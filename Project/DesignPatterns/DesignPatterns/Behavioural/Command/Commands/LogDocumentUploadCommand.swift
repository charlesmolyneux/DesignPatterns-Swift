class LogDocumentUploadCommand: Command {
  private let logger: AnalyticsService
  private let count: Int
  
  public init(logger: AnalyticsService, count: Int) {
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
