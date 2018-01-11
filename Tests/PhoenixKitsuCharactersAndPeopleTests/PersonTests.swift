import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class PersonTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "people",
    "links": [
      "self": "https://kitsu.io/api/edge/people/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z",
      "image": "https://media.kitsu.io/people/images/1/original.jpg?1416260317",
      "name": "Masahiko Minami",
      "malId": 6519
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "people",
    "links": [
      "self": "https://kitsu.io/api/edge/people/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z"
    ]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "people",
    "links": [
      "self": "https://kitsu.io/api/edge/people/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z",
      "image": nil,
      "name": nil,
      "malId": nil
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "links": [
      "self": "https://kitsu.io/api/edge/people/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": "",
      "role": ""
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": nil,
    "type": "people",
    "links": [
      "self": "https://kitsu.io/api/edge/people/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]
  
  var person: Person?
  var personAttributes: PersonAttributes?
  
  override func tearDown() {
    person = nil
    personAttributes = nil
    
    super.tearDown()
  }
  
  func testPersonFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      person = try? decoder.decode(Person.self, from: data!)
    } else {
      person = nil
    }
    personAttributes = person?.attributes
    
    XCTAssertNotNil(person)
    
    XCTAssertEqual(person?.objectID, "4")
    XCTAssertEqual(person?.type, "people")
    
    XCTAssertNotNil(personAttributes)
    
    XCTAssertEqual(personAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(personAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertEqual(personAttributes?.image,
                   "https://media.kitsu.io/people/images/1/original.jpg?1416260317")
    XCTAssertEqual(personAttributes?.name, "Masahiko Minami")
    XCTAssertEqual(personAttributes?.myAnimeListID, 6519)
  }
  
  func testPersonValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      person = try? decoder.decode(Person.self, from: data!)
    } else {
      person = nil
    }
    personAttributes = person?.attributes
    
    XCTAssertNotNil(person)
    
    XCTAssertEqual(person?.objectID, "4")
    XCTAssertEqual(person?.type, "people")
    
    XCTAssertNotNil(personAttributes)
    
    XCTAssertEqual(personAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(personAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertNil(personAttributes?.image)
    XCTAssertNil(personAttributes?.name)
    XCTAssertNil(personAttributes?.myAnimeListID)
  }
  
  func testPersonValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      person = try? decoder.decode(Person.self, from: data!)
    } else {
      person = nil
    }
    personAttributes = person?.attributes
    
    XCTAssertNotNil(person)
    
    XCTAssertEqual(person?.objectID, "4")
    XCTAssertEqual(person?.type, "people")
    
    XCTAssertNotNil(personAttributes)
    
    XCTAssertEqual(personAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(personAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertNil(personAttributes?.image)
    XCTAssertNil(personAttributes?.name)
    XCTAssertNil(personAttributes?.myAnimeListID)
  }
  
  func testPersonInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      person = try? decoder.decode(Person.self, from: data!)
    } else {
      person = nil
    }
    
    XCTAssertNil(person)
  }
  
  func testPersonInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      person = try? decoder.decode(Person.self, from: data!)
    } else {
      person = nil
    }
    
    XCTAssertNil(person)
  }
}
