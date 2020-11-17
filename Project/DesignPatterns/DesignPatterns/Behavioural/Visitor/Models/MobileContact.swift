public struct MobileContact {
  let phoneNumber: String
  let importance: ContactImportance
  
  enum ContactImportance {
    case standard, emergencyContact
  }
}
