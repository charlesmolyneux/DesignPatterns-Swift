struct StandardAlertPolicy: AlertPolicy {
  func receiveAlert(for call: IncomingCall) -> Bool {
    true
  }
  
  func receiveAlert(for instantMessage: InstantMessage) -> Bool {
    true
  }
  
  func receiveAlert(for pushNotification: PushNotification) -> Bool {
    true
  }
}
