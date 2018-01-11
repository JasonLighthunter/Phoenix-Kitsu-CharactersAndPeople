import PhoenixKitsuCore
import Requestable

public class AnimeStaff: KitsuObject<AnimeStaffAttributes>, Requestable {
  public static var requestURLString = "anime-staff"
}

public class AnimeStaffAttributes: KitsuObjectAttributes {
  public let createdAt: String?
  public let updatedAt: String?
  public let role: String?
}
