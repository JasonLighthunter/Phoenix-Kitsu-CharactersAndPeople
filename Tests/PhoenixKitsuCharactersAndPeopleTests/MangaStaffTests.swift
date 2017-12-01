import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class MangaStaffTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "mangaStaff",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-staff/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "role": "studio"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "mangaStaff",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-staff/4"
    ],
    "attributes": [:]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "mangaStaff",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-staff/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-staff/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": "",
      "role": ""
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": nil,
    "type": "mangaStaff",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-staff/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]
  
  var mangaStaff: MangaStaff?
  var mangaStaffAttributes: MangaStaffAttributes?
  
  override func tearDown() {
    mangaStaff = nil
    mangaStaffAttributes = nil
    
    super.tearDown()
  }
  
  func testMangaStaffFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaStaff = try? decoder.decode(MangaStaff.self, from: data!)
    } else {
      mangaStaff = nil
    }
    mangaStaffAttributes = mangaStaff?.attributes
    
    XCTAssertNotNil(mangaStaff)
    
    XCTAssertEqual(mangaStaff?.objectID, "4")
    XCTAssertEqual(mangaStaff?.type, "mangaStaff")
    
    XCTAssertNotNil(mangaStaffAttributes)
    
    XCTAssertEqual(mangaStaffAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(mangaStaffAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(mangaStaffAttributes?.role, "studio")
  }
  
  func testMangaStaffValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaStaff = try? decoder.decode(MangaStaff.self, from: data!)
    } else {
      mangaStaff = nil
    }
    mangaStaffAttributes = mangaStaff?.attributes
    
    XCTAssertNotNil(mangaStaff)
    
    XCTAssertEqual(mangaStaff?.objectID, "4")
    XCTAssertEqual(mangaStaff?.type, "mangaStaff")
    
    XCTAssertNotNil(mangaStaffAttributes)
    
    XCTAssertNil(mangaStaffAttributes?.createdAt)
    XCTAssertNil(mangaStaffAttributes?.updatedAt)
    XCTAssertNil(mangaStaffAttributes?.role)
  }
  
  func testMangaStaffValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaStaff = try? decoder.decode(MangaStaff.self, from: data!)
    } else {
      mangaStaff = nil
    }
    mangaStaffAttributes = mangaStaff?.attributes
    
    XCTAssertNotNil(mangaStaff)
    
    XCTAssertEqual(mangaStaff?.objectID, "4")
    XCTAssertEqual(mangaStaff?.type, "mangaStaff")
    
    XCTAssertNotNil(mangaStaffAttributes)
    
    XCTAssertNil(mangaStaffAttributes?.createdAt)
    XCTAssertNil(mangaStaffAttributes?.updatedAt)
    XCTAssertNil(mangaStaffAttributes?.role)
  }
  
  func testMangaStaffInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaStaff = try? decoder.decode(MangaStaff.self, from: data!)
    } else {
      mangaStaff = nil
    }
    
    XCTAssertNil(mangaStaff)
  }
  
  func testMangaStaffInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaStaff = try? decoder.decode(MangaStaff.self, from: data!)
    } else {
      mangaStaff = nil
    }
    
    XCTAssertNil(mangaStaff)
  }
}
