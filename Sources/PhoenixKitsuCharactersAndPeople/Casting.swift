import PhoenixKitsuCore

public class Casting: KitsuObject {
  public static var requestURLString = "castings"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: CastingAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
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
