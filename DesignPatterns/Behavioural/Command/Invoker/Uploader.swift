protocol Invoker {
  func add(command: Command)
}

class Uploader: Invoker {
  private var finished: [Command] = []
  private var failed: [Command] = []
  private var pending: [Command] = []
  
  func add(command: Command) {
    pending.append(command)
  }
  
  func execute() {
    pending.forEach { command in
      if case .success(true) = command.execute() {
        finished.append(command)
      } else {
        failed.append(command)
      }
    }
    
    pending.removeAll()
  }
}
