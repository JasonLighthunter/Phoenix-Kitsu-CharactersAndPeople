import PhoenixKitsuCore
import Requestable

public class Person: KitsuObject<PersonAttributes>, Requestable {
  public static var requestURLString = "people"
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
