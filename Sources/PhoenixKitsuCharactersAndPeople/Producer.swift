import PhoenixKitsuCore

public class Producer: KitsuObject {
  public static var requestURLString = "producers"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: ProducerAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class ProducerAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let slug: String?
  public let name: String?
}
