import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class AnimeStaffTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "animeStaff",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-staff/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "role": "studio"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "animeStaff",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-staff/4"
    ],
    "attributes": [:]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "animeStaff",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-staff/4"
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
      "self": "https://kitsu.io/api/edge/anime-staff/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": "",
      "role": ""
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": nil,
    "type": "animeStaff",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-staff/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]
  
  var animeStaff: AnimeStaff?
  var animeStaffAttributes: AnimeStaffAttributes?
  
  override func tearDown() {
    animeStaff = nil
    animeStaffAttributes = nil
    
    super.tearDown()
  }
  
  func testAnimeProdcutionFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeStaff = try? decoder.decode(AnimeStaff.self, from: data!)
    } else {
      animeStaff = nil
    }
    animeStaffAttributes = animeStaff?.attributes
    
    XCTAssertNotNil(animeStaff)
    
    XCTAssertEqual(animeStaff?.objectID, "4")
    XCTAssertEqual(animeStaff?.type, "animeStaff")
    
    XCTAssertNotNil(animeStaffAttributes)
    
    XCTAssertEqual(animeStaffAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(animeStaffAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(animeStaffAttributes?.role, "studio")
  }
  
  func testAnimeStaffValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeStaff = try? decoder.decode(AnimeStaff.self, from: data!)
    } else {
      animeStaff = nil
    }
    animeStaffAttributes = animeStaff?.attributes
    
    XCTAssertNotNil(animeStaff)
    
    XCTAssertEqual(animeStaff?.objectID, "4")
    XCTAssertEqual(animeStaff?.type, "animeStaff")
    
    XCTAssertNotNil(animeStaffAttributes)
    
    XCTAssertNil(animeStaffAttributes?.createdAt)
    XCTAssertNil(animeStaffAttributes?.updatedAt)
    XCTAssertNil(animeStaffAttributes?.role)
  }
  
  func testAnimeStaffValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeStaff = try? decoder.decode(AnimeStaff.self, from: data!)
    } else {
      animeStaff = nil
    }
    animeStaffAttributes = animeStaff?.attributes
    
    XCTAssertNotNil(animeStaff)
    
    XCTAssertEqual(animeStaff?.objectID, "4")
    XCTAssertEqual(animeStaff?.type, "animeStaff")
    
    XCTAssertNotNil(animeStaffAttributes)
    
    XCTAssertNil(animeStaffAttributes?.createdAt)
    XCTAssertNil(animeStaffAttributes?.updatedAt)
    XCTAssertNil(animeStaffAttributes?.role)
  }
  
  func testAnimeStaffInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeStaff = try? decoder.decode(AnimeStaff.self, from: data!)
    } else {
      animeStaff = nil
    }
    
    XCTAssertNil(animeStaff)
  }
  
  func testAnimeStaffInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeStaff = try? decoder.decode(AnimeStaff.self, from: data!)
    } else {
      animeStaff = nil
    }
    
    XCTAssertNil(animeStaff)
  }
}


