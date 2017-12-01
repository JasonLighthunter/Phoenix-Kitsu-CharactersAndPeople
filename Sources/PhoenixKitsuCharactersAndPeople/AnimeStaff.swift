import PhoenixKitsuCore

public class AnimeStaff: KitsuObject {
  public static var requestURLString = "anime-staff"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: AnimeStaffAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class AnimeStaffAttributes: KitsuObjectAttributes {
  public let createdAt: String?
  public let updatedAt: String?
  public let role: String?
}
