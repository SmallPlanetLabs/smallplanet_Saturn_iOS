//
//  SaturnTests.swift
//  SaturnTests
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import XCTest
@testable import Saturn

class SaturnTests: XCTestCase {
    
    func testNSObject() {
        let x = NSObject.readFromString("<NSObject id='Titan'/>") as? NSObject
        XCTAssert(x != nil)
        XCTAssertEqual(x!.id, "Titan")
    }
    
    func testUIView() {
        let x = UIView.readFromString("<UIView id='Rhea' backgroundColor='#8000FF' alpha='0.7' frame='10,20,120,80' ><UIView backgroundColor='#FF4466FF' frame='5,5,40,40' alpha='0.9' /></UIView>") as? UIView
        XCTAssert(x != nil)
        XCTAssertEqual(x?.subviews.count, 1)
        XCTAssertEqual(x!.id, "Rhea")
        XCTAssert(fabs(Float(x!.alpha) - 0.7) < FLT_EPSILON)
        XCTAssertEqual(x?.backgroundColor?.string, "#8000FFFF")
        XCTAssertEqual(x?.frame, CGRect(x: 10, y: 20, width: 120, height: 80))
    }
    
}
