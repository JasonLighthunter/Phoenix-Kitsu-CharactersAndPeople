import XCTest
@testable import PhoenixKitsuCharactersAndPeople

class ProducerTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "producers",
    "links": [
      "self": "https://kitsu.io/api/edge/producers/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z",
      "slug": "sunrise",
      "name": "Sunrise"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "producers",
    "links": [
      "self": "https://kitsu.io/api/edge/producers/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z"
    ]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "producers",
    "links": [
      "self": "https://kitsu.io/api/edge/producers/4"
    ],
    "attributes": [
      "createdAt": "2017-07-27T22:21:26.824Z",
      "updatedAt": "2017-07-27T22:47:45.129Z",
      "slug": nil,
      "name": nil
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "links": [
      "self": "https://kitsu.io/api/edge/producers/4"
    ],
    "attributes": [
      "createdAt": "",
      "updatedAt": "",
      "role": ""
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": nil,
    "type": "producers",
    "links": [
      "self": "https://kitsu.io/api/edge/producers/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": nil,
      "role": nil
    ]
  ]
  
  var producer: Producer?
  var producerAttributes: ProducerAttributes?
  
  override func tearDown() {
    producer = nil
    producerAttributes = nil
    
    super.tearDown()
  }
  
  func testProducerFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      producer = try? decoder.decode(Producer.self, from: data!)
    } else {
      producer = nil
    }
    producerAttributes = producer?.attributes
    
    XCTAssertNotNil(producer)
    
    XCTAssertEqual(producer?.objectID, "4")
    XCTAssertEqual(producer?.type, "producers")
    
    XCTAssertNotNil(producerAttributes)
    
    XCTAssertEqual(producerAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(producerAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertEqual(producerAttributes?.slug, "sunrise")
    XCTAssertEqual(producerAttributes?.name, "Sunrise")
  }
  
  func testProducerValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      producer = try? decoder.decode(Producer.self, from: data!)
    } else {
      producer = nil
    }
    producerAttributes = producer?.attributes
    
    XCTAssertNotNil(producer)
    
    XCTAssertEqual(producer?.objectID, "4")
    XCTAssertEqual(producer?.type, "producers")
    
    XCTAssertNotNil(producerAttributes)
    
    XCTAssertEqual(producerAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(producerAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertNil(producerAttributes?.slug)
    XCTAssertNil(producerAttributes?.name)
  }
  
  func testProducerValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      producer = try? decoder.decode(Producer.self, from: data!)
    } else {
      producer = nil
    }
    producerAttributes = producer?.attributes
    
    XCTAssertNotNil(producer)
    
    XCTAssertEqual(producer?.objectID, "4")
    XCTAssertEqual(producer?.type, "producers")
    
    XCTAssertNotNil(producerAttributes)
    
    XCTAssertEqual(producerAttributes?.createdAt, "2017-07-27T22:21:26.824Z")
    XCTAssertEqual(producerAttributes?.updatedAt, "2017-07-27T22:47:45.129Z")
    XCTAssertNil(producerAttributes?.slug)
    XCTAssertNil(producerAttributes?.name)
  }
  
  func testProducerInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      producer = try? decoder.decode(Producer.self, from: data!)
    } else {
      producer = nil
    }
    
    XCTAssertNil(producer)
  }
  
  func testProducerInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      producer = try? decoder.decode(Producer.self, from: data!)
    } else {
      producer = nil
    }
    
    XCTAssertNil(producer)
  }
}

