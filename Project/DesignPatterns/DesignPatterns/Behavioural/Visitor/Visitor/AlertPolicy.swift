protocol AlertPolicy {
  func receiveAlert(for call: IncomingCall) -> Bool
  func receiveAlert(for instantMessage: InstantMessage) -> Bool
  func receiveAlert(for pushNotification: PushNotification) -> Bool
}
