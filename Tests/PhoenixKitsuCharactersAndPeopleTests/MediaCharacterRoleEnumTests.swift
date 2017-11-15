import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class MediaCharacterRoleEnumTests: XCTestCase {
  func testMediaCharacterRoleEnum() {
    XCTAssertEqual(MediaCharacterRoleEnum(rawValue: "main"), MediaCharacterRoleEnum.main)
    XCTAssertEqual(MediaCharacterRoleEnum(rawValue: "supporting"),
                   MediaCharacterRoleEnum.supporting)
    XCTAssertNil(MediaCharacterRoleEnum(rawValue: "InvalidInput"))
  }
}
