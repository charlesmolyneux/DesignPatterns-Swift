class VisitorAppExample {
  private(set) var policy: AlertPolicy
  
  init(policy: AlertPolicy) {
    self.policy = policy
  }
  
  func update(to policy: AlertPolicy) {
    self.policy = policy
  }

  func shouldNotifyUser(of alert: Alert) -> Bool {
    return alert.accept(visitor: policy)
  }
}
