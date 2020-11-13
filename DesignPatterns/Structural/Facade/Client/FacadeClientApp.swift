class FacadePatternApp {
  let fileManager = Files()
  
  func save(information: String, to dataFormat: DataFormat, fileName: String) {
    do {
      try fileManager.save(dataString: information, type: dataFormat, fileName: fileName)
    } catch {
      handleUploadError(error: error)
    }
  }
  
  private func handleUploadError(error: Error) {
    //MARK - Handle error here
  }
}
