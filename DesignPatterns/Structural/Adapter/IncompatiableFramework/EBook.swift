public struct EBook {
  let price: Double
  let isbn: String
  let platform: DigitalPlatform
  
  public enum DigitalPlatform {
    case kindle, amazon, appleBooks
  }
}
