import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class CharacterTests: XCTestCase {
  typealias KitsuCharacter = PhoenixKitsuCharactersAndPeople.Character
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "characters",
    "links": [
      "self": "https://kitsu.io/api/edge/characters/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z",
      "slug": "jet",
      "name": "Jet Black",
      "malId": 3,
      "description": "description",
      "image": [
        "original": "https://media.kitsu.io/characters/images/1/original.jpg?1483096805"
      ]
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "characters",
    "links": [
      "self": "https://kitsu.io/api/edge/characters/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z",
    ]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "characters",
    "links": [
      "self": "https://kitsu.io/api/edge/characters/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z",
      "slug": nil,
      "name": nil,
      "malId": nil,
      "description": nil,
      "image": nil
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "links": [
      "self": "https://kitsu.io/api/edge/characters/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": ""
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": nil,
    "type": "characters",
    "links": [
      "self": "https://kitsu.io/api/edge/characters/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil
    ]
  ]
  
  var character: KitsuCharacter?
  var characterAttributes: CharacterAttributes?
  
  override func tearDown() {
    character = nil
    characterAttributes = nil
    
    super.tearDown()
  }
  
  func testAnimeProdcutionFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      character = try? decoder.decode(KitsuCharacter.self, from: data!)
    } else {
      character = nil
    }
    characterAttributes = character?.attributes
    
    XCTAssertNotNil(character)
    
    XCTAssertEqual(character?.objectID, "4")
    XCTAssertEqual(character?.type, "characters")
    
    XCTAssertNotNil(characterAttributes)
    
    XCTAssertEqual(characterAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(characterAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertEqual(characterAttributes?.slug, "jet")
    XCTAssertEqual(characterAttributes?.name, "Jet Black")
    XCTAssertEqual(characterAttributes?.myAnimeListID, 3)
    XCTAssertEqual(characterAttributes?.description, "description")
  }
  
  func testCharacterValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      character = try? decoder.decode(KitsuCharacter.self, from: data!)
    } else {
      character = nil
    }
    characterAttributes = character?.attributes
    
    XCTAssertNotNil(character)
    
    XCTAssertEqual(character?.objectID, "4")
    XCTAssertEqual(character?.type, "characters")
    
    XCTAssertNotNil(characterAttributes)
    
    XCTAssertEqual(characterAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(characterAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertNil(characterAttributes?.slug)
    XCTAssertNil(characterAttributes?.name)
    XCTAssertNil(characterAttributes?.myAnimeListID)
    XCTAssertNil(characterAttributes?.description)
  }
  
  func testCharacterValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      character = try? decoder.decode(KitsuCharacter.self, from: data!)
    } else {
      character = nil
    }
    characterAttributes = character?.attributes
    
    XCTAssertNotNil(character)
    
    XCTAssertEqual(character?.objectID, "4")
    XCTAssertEqual(character?.type, "characters")
    
    XCTAssertNotNil(characterAttributes)
    
    XCTAssertEqual(characterAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(characterAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertNil(characterAttributes?.slug)
    XCTAssertNil(characterAttributes?.name)
    XCTAssertNil(characterAttributes?.myAnimeListID)
    XCTAssertNil(characterAttributes?.description)
  }
  
  func testCharacterInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      character = try? decoder.decode(KitsuCharacter.self, from: data!)
    } else {
      character = nil
    }
    
    XCTAssertNil(character)
  }
  
  func testCharacterInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      character = try? decoder.decode(KitsuCharacter.self, from: data!)
    } else {
      character = nil
    }
    
    XCTAssertNil(character)
  }
}

