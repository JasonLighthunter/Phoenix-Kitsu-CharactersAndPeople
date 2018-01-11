import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class MangaCharacterTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "mangaCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-characters/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "role": "main"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "mangaCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-characters/4"
    ],
    "attributes": [
      "role": "supporting"
    ]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "mangaCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-characters/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": "supporting"
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-characters/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": "",
      "role": ""
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": nil,
    "type": "mangaCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/manga-characters/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]
  
  var mangaCharacter: MangaCharacter?
  var mangaCharacterAttributes: MangaCharacterAttributes?
  
  override func tearDown() {
    mangaCharacter = nil
    mangaCharacterAttributes = nil
    
    super.tearDown()
  }
  
  func testMangaCharacterFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaCharacter = try? decoder.decode(MangaCharacter.self, from: data!)
    } else {
      mangaCharacter = nil
    }
    mangaCharacterAttributes = mangaCharacter?.attributes
    
    XCTAssertNotNil(mangaCharacter)
    
    XCTAssertEqual(mangaCharacter?.objectID, "4")
    XCTAssertEqual(mangaCharacter?.type, "mangaCharacters")
    
    XCTAssertNotNil(mangaCharacterAttributes)
    
    XCTAssertEqual(mangaCharacterAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(mangaCharacterAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(mangaCharacterAttributes?.role, MediaCharacterRoleEnum.main)
  }
  
  func testMangaCharacterValidMissingData() {
    let json = self.validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaCharacter = try? decoder.decode(MangaCharacter.self, from: data!)
    } else {
      mangaCharacter = nil
    }
    mangaCharacterAttributes = mangaCharacter?.attributes
    
    XCTAssertNotNil(mangaCharacter)
    
    XCTAssertEqual(mangaCharacter?.objectID, "4")
    XCTAssertEqual(mangaCharacter?.type, "mangaCharacters")
    
    XCTAssertNotNil(mangaCharacterAttributes)
    
    XCTAssertNil(mangaCharacterAttributes?.createdAt)
    XCTAssertNil(mangaCharacterAttributes?.updatedAt)
    XCTAssertEqual(mangaCharacterAttributes?.role, MediaCharacterRoleEnum.supporting)
  }
  
  func testMangaCharacterValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaCharacter = try? decoder.decode(MangaCharacter.self, from: data!)
    } else {
      mangaCharacter = nil
    }
    mangaCharacterAttributes = mangaCharacter?.attributes
    
    XCTAssertNotNil(mangaCharacter)
    
    XCTAssertEqual(mangaCharacter?.objectID, "4")
    XCTAssertEqual(mangaCharacter?.type, "mangaCharacters")
    
    XCTAssertNotNil(mangaCharacterAttributes)
    
    XCTAssertNil(mangaCharacterAttributes?.createdAt)
    XCTAssertNil(mangaCharacterAttributes?.updatedAt)
    XCTAssertEqual(mangaCharacterAttributes?.role, MediaCharacterRoleEnum.supporting)
  }
  
  func testMangaCharacterInvalidMissingData() {
    let json = self.invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaCharacter = try? decoder.decode(MangaCharacter.self, from: data!)
    } else {
      mangaCharacter = nil
    }
    
    XCTAssertNil(mangaCharacter)
  }
  
  func testMangaCharacterInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      mangaCharacter = try? decoder.decode(MangaCharacter.self, from: data!)
    } else {
      mangaCharacter = nil
    }
    
    XCTAssertNil(mangaCharacter)
  }
}

