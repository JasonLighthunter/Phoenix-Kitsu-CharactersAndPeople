import PhoenixKitsuCore
import Requestable

public class AnimeProduction: KitsuObject<AnimeProductionAttributes>, Requestable {
  public static var requestURLString = "anime-productions"
}

public class AnimeProductionAttributes: KitsuObjectAttributes {
  public let createdAt: String?
  public let updatedAt: String?
  public let role: AnimeProductionRoleEnum
  
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case role
  }
}
