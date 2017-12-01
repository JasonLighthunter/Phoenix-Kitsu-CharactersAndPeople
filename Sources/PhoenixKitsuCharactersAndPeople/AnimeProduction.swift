import PhoenixKitsuCore

public class AnimeProduction: KitsuObject {
  public static var requestURLString = "anime-productions"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public private(set) var attributes: AnimeProductionAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class AnimeProductionAttributes: KitsuObjectAttributes {
  public private(set) var createdAt: String?
  public private(set) var updatedAt: String?
  public let role: AnimeProductionRoleEnum?
  
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case role
  }
}
