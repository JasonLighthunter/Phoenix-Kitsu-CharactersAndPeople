import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class CastingTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "castings",
    "links": [
      "self": "https://kitsu.io/api/edge/castings/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "role": "producer",
      "voiceActor": false,
      "featured": false,
      "language": "English"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "castings",
    "links": [
      "self": "https://kitsu.io/api/edge/castings/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "voiceActor": false,
      "featured": false,
    ]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "castings",
    "links": [
      "self": "https://kitsu.io/api/edge/castings/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "role": nil,
      "voiceActor": false,
      "featured": false,
      "language": nil
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "links": [
      "self": "https://kitsu.io/api/edge/castings/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": "",
      "role": ""
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": nil,
    "type": "castings",
    "links": [
      "self": "https://kitsu.io/api/edge/castings/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]
  
  var casting: Casting?
  var castingAttributes: CastingAttributes?
  
  override func tearDown() {
    casting = nil
    castingAttributes = nil
    
    super.tearDown()
  }
  
  func testAnimeProdcutionFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      casting = try? decoder.decode(Casting.self, from: data!)
    } else {
      casting = nil
    }
    castingAttributes = casting?.attributes
    
    XCTAssertNotNil(casting)
    
    XCTAssertEqual(casting?.objectID, "4")
    XCTAssertEqual(casting?.type, "castings")
    
    XCTAssertNotNil(castingAttributes)
    
    XCTAssertEqual(castingAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(castingAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(castingAttributes?.role, "producer")
    XCTAssertFalse((castingAttributes?.isVoiceActor)!)
    XCTAssertFalse((castingAttributes?.isFeatured)!)
    XCTAssertEqual(castingAttributes?.language, "English")
  }
  
  func testCastingValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      casting = try? decoder.decode(Casting.self, from: data!)
    } else {
      casting = nil
    }
    castingAttributes = casting?.attributes
    
    XCTAssertNotNil(casting)
    
    XCTAssertEqual(casting?.objectID, "4")
    XCTAssertEqual(casting?.type, "castings")
    
    XCTAssertNotNil(castingAttributes)
    
    XCTAssertEqual(castingAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(castingAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertNil(castingAttributes?.role)
    XCTAssertFalse((castingAttributes?.isVoiceActor)!)
    XCTAssertFalse((castingAttributes?.isFeatured)!)
    XCTAssertNil(castingAttributes?.language)
  }
  
  func testCastingValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      casting = try? decoder.decode(Casting.self, from: data!)
    } else {
      casting = nil
    }
    castingAttributes = casting?.attributes
    
    XCTAssertNotNil(casting)
    
    XCTAssertEqual(casting?.objectID, "4")
    XCTAssertEqual(casting?.type, "castings")
    
    XCTAssertNotNil(castingAttributes)
    
    XCTAssertEqual(castingAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(castingAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertNil(castingAttributes?.role)
    XCTAssertFalse((castingAttributes?.isVoiceActor)!)
    XCTAssertFalse((castingAttributes?.isFeatured)!)
    XCTAssertNil(castingAttributes?.language)
  }
  
  func testCastingInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      casting = try? decoder.decode(Casting.self, from: data!)
    } else {
      casting = nil
    }
    
    XCTAssertNil(casting)
  }
  
  func testCastingInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      casting = try? decoder.decode(Casting.self, from: data!)
    } else {
      casting = nil
    }
    
    XCTAssertNil(casting)
  }
}
