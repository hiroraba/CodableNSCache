//
//  CodableNSCacheTests.swift
//  CodableNSCacheTests
//
//  Created by matsuohiroki on 2017/11/28.
//  Copyright © 2017年 matsuohiroki. All rights reserved.
//

import XCTest
@testable import CodableNSCache

class CodableNSCacheTests: XCTestCase {
    
    struct Person:Codable {
        var name:String
        var address:String
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCodableNSCache() {
        let cache = CodableNSCache<Person>()
        let person = Person(name: "hiroraba", address: "kyoto")
        cache.setObject(obj: person, forKey: "example")
        let p = cache.objectForKey(forKey: "example")
        XCTAssertEqual("hiroraba", p?.name)
    }
    
    func testCodableNSCacheSubscript() {
        var cache = CodableNSCache<Person>()
        let person = Person(name: "hiroraba", address: "kyoto")
        cache["example"] = person
        if let p = cache["example"] {
            XCTAssertEqual("hiroraba", p.name)
        } else {
            XCTFail()
        }
    }
}
