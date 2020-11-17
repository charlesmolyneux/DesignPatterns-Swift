protocol LoginService {
  func login(username: String, password: String, completion: @escaping (Result<StoreUser, Error>) -> Void)
}

class DefaultLoginService: LoginService {
  
  func login(username: String, password: String, completion: @escaping (Result<StoreUser, Error>) -> Void) {
    //let body = makeBody(with: username, password: password)
    //network.makeRequest(with: body, completion: completion)
  }
}
