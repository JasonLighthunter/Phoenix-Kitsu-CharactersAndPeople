import PhoenixKitsuCore

public class MangaStaff: KitsuObject {
    public static var requestURLString = "manga-staff"
    
    public let objectID: String
    public let type: String
    public let links: Links
    public let attributes: MangaStaffAttributes?
    
    private enum CodingKeys: String, CodingKey {
        case objectID = "id"
        case type
        case links
        case attributes
    }
}

public class MangaStaffAttributes: KitsuObjectAttributes {
    public let createdAt: String?
    public let updatedAt: String?
    public let role: String?
}
