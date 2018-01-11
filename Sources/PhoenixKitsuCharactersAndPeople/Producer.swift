import PhoenixKitsuCore
import Requestable

public class Producer: KitsuObject<ProducerAttributes>, Requestable {
  public static var requestURLString = "producers"
}

public class ProducerAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let slug: String?
  public let name: String?
}
