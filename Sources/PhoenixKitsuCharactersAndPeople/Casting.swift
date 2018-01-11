import PhoenixKitsuCore
import Requestable

public class Casting: KitsuObject<CastingAttributes>, Requestable {
  public static var requestURLString = "castings"
}

public class CastingAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let role: String?
  public let isVoiceActor: Bool
  public let isFeatured: Bool
  public let language: String?
  
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case role
    case isVoiceActor = "voiceActor"
    case isFeatured = "featured"
    case language
  }
}
