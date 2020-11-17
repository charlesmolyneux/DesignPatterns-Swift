class DocumentUploaderApp {
  private let documentUploader = Uploader()
  private let service = UploadService()
  private let logger = FirebaseAnalyticsService()
  
  private var documentData: [Data] = []
  
  //IBAction
  func uploadTapped() {
    addUploadCommands()
    documentUploader.execute()
  }
  
  private func addUploadCommands() {
    documentData.forEach { document in
      documentUploader.add(command: UploadDocumentCommand(service, document))
    }
    
    documentUploader.add(command: LogDocumentUploadCommand(logger: logger, count: documentData.count))
  }
  
  //This would be the callback from DocumentManager
  func didAddFile(with data: Data) {
    self.documentData.append(data)
  }
}
