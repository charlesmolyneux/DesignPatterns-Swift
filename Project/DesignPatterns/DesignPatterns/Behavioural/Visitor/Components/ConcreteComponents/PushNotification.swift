struct PushNotification: Alert {
  let app: MobileApp

  func accept(visitor: AlertPolicy) -> Bool {
    return visitor.receiveAlert(for: self)
  }
}
