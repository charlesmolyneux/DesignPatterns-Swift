class ArcadeGameQueryBuilder: PagedQueryBuilder {
  public func genre(_ genre: ArcadeGameGenre?) -> Self {
    if let genre = genre?.rawValue {
      items.append(URLQueryItem(name: "genre", value: genre))
    }
    
    return self
  }
}

public enum ArcadeGameGenre: String {
  case retro, fantasy, fighter, space, new
}
