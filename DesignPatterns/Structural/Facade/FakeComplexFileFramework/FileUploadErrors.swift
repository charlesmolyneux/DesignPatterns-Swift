enum DataUploadError: Error {
  case malformedData
  case couldNotCreateFile(DataFormat)
  case couldNotSaveToDisk
}
