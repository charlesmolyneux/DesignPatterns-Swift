public class FileFormatConverter {
  public init() { }
  
  public func convert(string: String, to type: DataFormat) throws -> Data {
    switch type {
    case .json:
      return try json(from: string)
    case .xml:
      return try xml(from: string)
    }
  }
  
  private func json(from string: String) throws -> Data {
    guard let data = Data(base64Encoded: string) else {
      throw DataUploadError.couldNotCreateFile(.json)
    }
    
    guard let serializedData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Data else {
      throw DataUploadError.malformedData
    }
    
    return serializedData
  }
  
  private func xml(from string: String) throws -> Data {
    //MARK - This would go off to another class possibly to parse a string into an XML markup
    guard let data = Data(base64Encoded: string) else {
      throw DataUploadError.couldNotCreateFile(.xml)
    }
    
    return data
  }
}
