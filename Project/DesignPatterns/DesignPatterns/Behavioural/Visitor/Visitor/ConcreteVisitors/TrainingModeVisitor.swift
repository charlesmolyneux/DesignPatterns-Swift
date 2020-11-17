class TrainingModeAlertPolicy: AlertPolicy {
  private var apps: [MobileApp] = []
  private var contacts: [MobileContact] = []

  init(contacts: [MobileContact],
       apps: [MobileApp]) {
    self.contacts = contacts
    self.apps = apps
  }
  
  func receiveAlert(for call: IncomingCall) -> Bool {
    return contacts.contains { contact -> Bool in return call.contact.importance == .emergencyContact }
  }
  
  func receiveAlert(for instantMessage: InstantMessage) -> Bool {
    return contacts.contains { contact -> Bool in return instantMessage.contact.importance == .emergencyContact }
  }
  
  func receiveAlert(for pushNotification: PushNotification) -> Bool {
    return apps.contains { app -> Bool in  return
      pushNotification.app.priority == .veryHigh ||
        pushNotification.app.priority == .high }
  }
}
