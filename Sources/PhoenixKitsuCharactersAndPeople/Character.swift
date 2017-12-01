import PhoenixKitsuCore

public class Character: KitsuObject {
  public static var requestURLString = "castings"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public private(set) var attributes: CharacterAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class CharacterAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let slug: String?
  public let name: String?
  public let myAnimeListID: Int?
  public let description: String?
//  public let image: KitsuImage?
  
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case slug
    case name
    case myAnimeListID = "malId"
    case description
//    case image
  }
}
