import PhoenixKitsuCore

public class MangaCharacter: KitsuObject {
  public static var requestURLString = "manga-characters"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: MangaCharacterAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class MangaCharacterAttributes: KitsuObjectAttributes {
  public let createdAt: String?
  public let updatedAt: String?
  public let role: MediaCharacterRoleEnum
}
