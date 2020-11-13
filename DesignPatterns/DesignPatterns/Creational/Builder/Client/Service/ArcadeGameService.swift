public class ArcadeGameService {
  func fetchGames(take: Int, skip: Int, category: ArcadeGameGenre) {
    let _ = ArcadeGameQueryBuilder().genre(category).take(take).skip(5)
    //make http call with the above query.
  }
}

