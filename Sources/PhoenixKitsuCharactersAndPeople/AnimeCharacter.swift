import PhoenixKitsuCore

public class AnimeCharacter: KitsuObject {
  public static var requestURLString = "anime-characters"

  public let objectID: String
  public let type: String
  public let links: Links
  public private(set) var attributes: AnimeCharacterAttributes?

  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class AnimeCharacterAttributes: KitsuObjectAttributes {
  public private(set) var createdAt: String?
  public private(set) var updatedAt: String?
  public let role: KitsuMediaCharacterRoleEnum?
}
