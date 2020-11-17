struct IncomingCall: Alert {
  let contact: MobileContact
  
  func accept(visitor: AlertPolicy) -> Bool {
    return visitor.receiveAlert(for: self)
  }
}
