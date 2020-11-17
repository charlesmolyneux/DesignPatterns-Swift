struct SleepModeAlertPolicy: AlertPolicy {
  private var contacts: [MobileContact] = []

  init(contacts: [MobileContact]) {
    self.contacts = contacts
  }
  
  func receiveAlert(for call: IncomingCall) -> Bool {
    return contacts.contains { contact -> Bool in return call.contact.importance == .emergencyContact }
  }
  
  func receiveAlert(for instantMessage: InstantMessage) -> Bool {
    return false
  }
  
  func receiveAlert(for pushNotification: PushNotification) -> Bool {
    return false
  }
}
