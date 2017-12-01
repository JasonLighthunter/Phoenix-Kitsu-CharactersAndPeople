import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class AnimeProductionTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "animeProductions",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-productions/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "role": "studio"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "animeProductions",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-productions/4"
    ],
    "attributes": [
      "role": "studio"
    ]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "animeProductions",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-productions/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": "studio"
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
    "type": "animeProductions",
    "links": [
      "self": "https://kitsu.io/api/edge/anime-productions/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]
  
  var animeProduction: AnimeProduction?
  var animeProductionAttributes: AnimeProductionAttributes?
  
  override func tearDown() {
    animeProduction = nil
    animeProductionAttributes = nil
    
    super.tearDown()
  }
  
  func testAnimeProdcutionFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeProduction = try? decoder.decode(AnimeProduction.self, from: data!)
    } else {
      animeProduction = nil
    }
    animeProductionAttributes = animeProduction?.attributes
    
    XCTAssertNotNil(animeProduction)
    
    XCTAssertEqual(animeProduction?.objectID, "4")
    XCTAssertEqual(animeProduction?.type, "animeProductions")
    
    XCTAssertNotNil(animeProductionAttributes)
    
    XCTAssertEqual(animeProductionAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(animeProductionAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(animeProductionAttributes?.role, AnimeProductionRoleEnum.studio)
  }
  
  func testAnimeProductionValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeProduction = try? decoder.decode(AnimeProduction.self, from: data!)
    } else {
      animeProduction = nil
    }
    animeProductionAttributes = animeProduction?.attributes
    
    XCTAssertNotNil(animeProduction)
    
    XCTAssertEqual(animeProduction?.objectID, "4")
    XCTAssertEqual(animeProduction?.type, "animeProductions")
    
    XCTAssertNotNil(animeProductionAttributes)
    
    XCTAssertNil(animeProductionAttributes?.createdAt)
    XCTAssertNil(animeProductionAttributes?.updatedAt)
    XCTAssertEqual(animeProductionAttributes?.role, AnimeProductionRoleEnum.studio)
  }
  
  func testAnimeProductionValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeProduction = try? decoder.decode(AnimeProduction.self, from: data!)
    } else {
      animeProduction = nil
    }
    animeProductionAttributes = animeProduction?.attributes
    
    XCTAssertNotNil(animeProduction)
    
    XCTAssertEqual(animeProduction?.objectID, "4")
    XCTAssertEqual(animeProduction?.type, "animeProductions")
    
    XCTAssertNotNil(animeProductionAttributes)
    
    XCTAssertNil(animeProductionAttributes?.createdAt)
    XCTAssertNil(animeProductionAttributes?.updatedAt)
    XCTAssertEqual(animeProductionAttributes?.role, AnimeProductionRoleEnum.studio)
  }
  
  func testAnimeProductionInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeProduction = try? decoder.decode(AnimeProduction.self, from: data!)
    } else {
      animeProduction = nil
    }
    
    XCTAssertNil(animeProduction)
  }
  
  func testAnimeProductionInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      animeProduction = try? decoder.decode(AnimeProduction.self, from: data!)
    } else {
      animeProduction = nil
    }
    
    XCTAssertNil(animeProduction)
  }
}

