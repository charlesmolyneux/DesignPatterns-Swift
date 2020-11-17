struct LowBatteryAlertPolicy: AlertPolicy {
  private var apps: [MobileApp] = []

  init(apps: [MobileApp]) {
    self.apps = apps
  }

  func receiveAlert(for call: IncomingCall) -> Bool {
    true
  }
  
  func receiveAlert(for instantMessage: InstantMessage) -> Bool {
    true
  }
  
  func receiveAlert(for pushNotification: PushNotification) -> Bool {
    return apps.contains { app -> Bool in  return pushNotification.app.priority == .veryHigh }
  }
}
