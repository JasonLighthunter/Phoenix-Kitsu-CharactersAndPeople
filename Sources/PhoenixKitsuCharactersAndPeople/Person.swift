import PhoenixKitsuCore

public class Person: KitsuObject {
  public static var requestURLString = "people"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: PersonAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class PersonAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let image: String?
  public let name: String?
  public let myAnimeListID: Int?
  
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case image
    case name
    case myAnimeListID = "malId"
  }
}
