import PhoenixKitsuCore
import Requestable

public class MangaStaff: KitsuObject<MangaStaffAttributes>, Requestable {
  public static var requestURLString = "manga-staff"
}

public class MangaStaffAttributes: KitsuObjectAttributes {
  public let createdAt: String?
  public let updatedAt: String?
  public let role: String?
}
