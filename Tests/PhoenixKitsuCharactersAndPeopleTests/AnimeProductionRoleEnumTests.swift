import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class AnimeProductionRoleEnumTests: XCTestCase {
  func testAnimeProductionRoleEnum() {
    XCTAssertEqual(AnimeProductionRoleEnum(rawValue: "producer"), AnimeProductionRoleEnum.producer)
    XCTAssertEqual(AnimeProductionRoleEnum(rawValue: "licensor"),
                   AnimeProductionRoleEnum.licensor)
    XCTAssertEqual(AnimeProductionRoleEnum(rawValue: "studio"), AnimeProductionRoleEnum.studio)
    XCTAssertNil(AnimeProductionRoleEnum(rawValue: "InvalidInput"))
  }
}
