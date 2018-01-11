import PhoenixKitsuCore
import Requestable

public class Character: KitsuObject<CharacterAttributes>, Requestable {
  public static var requestURLString = "characters"
}

public class CharacterAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let slug: String?
  public let name: String?
  public let myAnimeListID: Int?
  public let description: String?
  public let image: Image?
  
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case slug
    case name
    case myAnimeListID = "malId"
    case description
    case image
  }
}
