import PhoenixKitsuCore
import Requestable

public class MangaCharacter: KitsuObject<MangaCharacterAttributes>, Requestable {
  public static var requestURLString = "manga-characters"
}

public class MangaCharacterAttributes: KitsuObjectAttributes {
  public let createdAt: String?
  public let updatedAt: String?
  public let role: MediaCharacterRoleEnum
}
