class UploadDocumentCommand: Command {
  private let receiver: UploadService
  private let data: Data
  
  public init(_ receiver: UploadService, _ data: Data) {
    self.receiver = receiver
    self.data = data
  }
  
  func execute() -> Result<Bool, Error> {
    receiver.upload(data: data)
  }
  
  func undo() -> Result<Bool, Error> {
    receiver.deleteData()
  }
}
