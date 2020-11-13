public class PathProvider {
  public init() { }
  
  public  func createDestinationPath(fileName: String) throws -> URL {
    guard let path = Foundation.FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
      throw DataUploadError.couldNotSaveToDisk
    }
    
    return path.appendingPathComponent("\(fileName)")
  }
}
