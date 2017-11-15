import PhoenixKitsuCore

public class AnimeCharacter: KitsuObject {
  public static var requestURLString = "anime-characters"

  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: AnimeCharacterAttributes?

  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class AnimeCharacterAttributes: KitsuObjectAttributes {
  public let createdAt: String?
  public let updatedAt: String?
  public let role: MediaCharacterRoleEnum?
}
