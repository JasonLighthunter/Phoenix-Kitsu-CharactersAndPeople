import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class AnimeCharacterTests: XCTestCase {
  let decoder = JSONDecoder()

  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "animeCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-characters/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "role": "main"
    ]
  ]

  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "animeCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-characters/4"
    ],
    "attributes": [
      "role": "supporting"
    ]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "animeCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-characters/4"
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
      "self": "https://kitsu.io/api/edge/anime-productions/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": "",
      "role": ""
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": nil,
    "type": "animeCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-characters/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]

  var animeCharacter: AnimeCharacter?
  var animeCharacterAttributes: AnimeCharacterAttributes?

  override func tearDown() {
    animeCharacter = nil
    animeCharacterAttributes = nil
    
    super.tearDown()
  }

  func testAnimeCharacterFullyFilled() {
    let json = self.fullyFilledJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }
    animeCharacterAttributes = animeCharacter?.attributes

    XCTAssertNotNil(self.animeCharacter)

    XCTAssertEqual(self.animeCharacter?.objectID, "4")
    XCTAssertEqual(self.animeCharacter?.type, "animeCharacters")
    
    XCTAssertNotNil(self.animeCharacterAttributes)

    XCTAssertEqual(self.animeCharacterAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.animeCharacterAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.animeCharacterAttributes?.role, MediaCharacterRoleEnum.main)
  }

  func testAnimeCharacterValidMissingData() {
    let json = self.validMissingDataJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }
    animeCharacterAttributes = animeCharacter?.attributes
    
    XCTAssertNotNil(self.animeCharacter)
    
    XCTAssertEqual(self.animeCharacter?.objectID, "4")
    XCTAssertEqual(self.animeCharacter?.type, "animeCharacters")
    
    XCTAssertNotNil(self.animeCharacterAttributes)
    
    XCTAssertNil(self.animeCharacterAttributes?.createdAt)
    XCTAssertNil(self.animeCharacterAttributes?.updatedAt)
    XCTAssertEqual(self.animeCharacterAttributes?.role, MediaCharacterRoleEnum.supporting)
  }
  
  func testAnimeCharacterValidNilData() {
    let json = self.validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }
    animeCharacterAttributes = animeCharacter?.attributes
    
    XCTAssertNotNil(self.animeCharacter)
    
    XCTAssertEqual(self.animeCharacter?.objectID, "4")
    XCTAssertEqual(self.animeCharacter?.type, "animeCharacters")
    
    XCTAssertNotNil(self.animeCharacterAttributes)
    
    XCTAssertNil(self.animeCharacterAttributes?.createdAt)
    XCTAssertNil(self.animeCharacterAttributes?.updatedAt)
    XCTAssertEqual(self.animeCharacterAttributes?.role, MediaCharacterRoleEnum.supporting)
  }

  func testAnimeCharactersInvalidMissingData() {
    let json = self.invalidMissingDataJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }

    XCTAssertNil(self.animeCharacter)
  }
  
  func testAnimeCharacterInvalidNilData() {
    let json = self.invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }
    
    XCTAssertNil(self.animeCharacter)
  }
}
