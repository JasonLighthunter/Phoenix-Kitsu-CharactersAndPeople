import PhoenixKitsuCore
import Requestable

public class AnimeCharacter: KitsuObject<AnimeCharacterAttributes>, Requestable {
  public static var requestURLString = "anime-characters"
}

public class AnimeCharacterAttributes: KitsuObjectAttributes {
  public let createdAt: String?
  public let updatedAt: String?
  public let role: MediaCharacterRoleEnum
}
