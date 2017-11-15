//
//  AnimeCharacterTests.swift
//  KitsuCharactersAndPeople
//
//  Created by Job Cuppen on 10/11/2017.

import XCTest
@testable import KitsuCharactersAndPeople
import KitsuEnums

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

  let validEmptyStringsJSON: [String : Any] = [
    "id": "4",
    "type": "animeCharacters",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-characters/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": "",
      "role": "supporting"
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

  let invalidEmptyStringsJSON: [String : Any] = [
    "id": "",
    "type": "",
    "links": [
      "self": ""
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
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

  override func tearDown() {
    self.animeCharacter = nil

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

    XCTAssertNotNil(self.animeCharacter)

    XCTAssertEqual(self.animeCharacter?.objectID, "4")
    XCTAssertEqual(self.animeCharacter?.type, "animeCharacters")
    XCTAssertEqual(self.animeCharacter?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.animeCharacter?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.animeCharacter?.characterRole, MediaCharacterRoleEnum.main)
  }

  func testAnimeCharacterValidEmptyStrings() {
    let json = self.validEmptyStringsJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }

    XCTAssertNotNil(self.animeCharacter)

    XCTAssertEqual(self.animeCharacter?.objectID, "4")
    XCTAssertEqual(self.animeCharacter?.type, "animeCharacters")
    XCTAssertNil(self.animeCharacter?.createdAt)
    XCTAssertNil(self.animeCharacter?.updatedAt)
    XCTAssertEqual(self.animeCharacter?.characterRole, MediaCharacterRoleEnum.supporting)
  }

  func testAnimeCharacterValidMissingData() {
    let json = self.validMissingDataJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }

    XCTAssertNotNil(self.animeCharacter)
    
    XCTAssertEqual(self.animeCharacter?.objectID, "4")
    XCTAssertEqual(self.animeCharacter?.type, "animeCharacters")
    XCTAssertNil(self.animeCharacter?.createdAt)
    XCTAssertNil(self.animeCharacter?.updatedAt)
    XCTAssertEqual(self.animeCharacter?.characterRole, MediaCharacterRoleEnum.supporting)
  }
  
  func testAnimeCharacterValidNilData() {
    let json = self.validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }
    
    XCTAssertNotNil(self.animeCharacter)
    
    XCTAssertEqual(self.animeCharacter?.objectID, "4")
    XCTAssertEqual(self.animeCharacter?.type, "animeCharacters")
    XCTAssertNil(self.animeCharacter?.createdAt)
    XCTAssertNil(self.animeCharacter?.updatedAt)
    XCTAssertEqual(self.animeCharacter?.characterRole, MediaCharacterRoleEnum.supporting)
  }

  func testAnimeCharactersInvalidEmptyStrings() {
    let json = self.invalidEmptyStringsJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeCharacter = try? decoder.decode(AnimeCharacter.self, from: data!)
    } else {
      animeCharacter = nil
    }

    XCTAssertNil(self.animeCharacter)
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
