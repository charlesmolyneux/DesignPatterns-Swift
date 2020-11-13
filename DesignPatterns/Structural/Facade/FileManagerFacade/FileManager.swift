public protocol FileManager {
  func save(dataString: String, type: DataFormat, fileName: String) throws
}

public class Files: FileManager {
  private let fileFormatConverter: FileFormatConverter
  private let pathProvider:  PathProvider
  private let storage:  FileStorage
  
  public init(formatter: FileFormatConverter = FileFormatConverter(),
              pathProvider: PathProvider = PathProvider(),
              storage: FileStorage = FileStorage()) {
    self.fileFormatConverter = formatter
    self.pathProvider = pathProvider
    self.storage = storage
  }
  
  public func save(dataString: String, type: DataFormat, fileName: String) throws {
    let destinationURL = try pathProvider.createDestinationPath(fileName: fileName)
    let data = try fileFormatConverter.convert(string: dataString, to: type)
    try storage.save(data: data, to: destinationURL)
  }
}
