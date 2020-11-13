public class ArcadeRequestBuilderAppExample {
  private let service: ArcadeGameService
  
  public init(service: ArcadeGameService) {
    self.service = service
  }
  
  //@IBAction
  func didTapFilterGame(with category: ArcadeGameGenre) {
    service.fetchGames(take: 10, skip: 0, category: category)
  }
}
