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
        let x = UIView.readFromString("<UIView id='Rhea' backgroundColor='#8000FF' alpha='0.7' frame='10,20,120,80' ><UIView id='Mimas' backgroundColor='#FF4466FF' frame='5,5,40,40' alpha='0.9'><UIView id='Rhea'/><UIView id='Rhea'/></UIView></UIView>") as? UIView
        XCTAssert(x != nil)
        XCTAssertEqual(x?.subviews.count, 1)
        XCTAssertEqual(x!.id, "Rhea")
        XCTAssert(fabs(Float(x!.alpha) - 0.7) < FLT_EPSILON)
        XCTAssertEqual(x?.backgroundColor?.string, "#8000FFFF")
        XCTAssertEqual(x?.frame, CGRect(x: 10, y: 20, width: 120, height: 80))
        XCTAssertEqual(x!.objectsWithId("Mimas").count, 1)
        XCTAssertEqual(x!.objectsWithId("Rhea").count, 3)
    }
    
    func testConstraints() {
        let xml =
        "<UIView id='root' backgroundColor='#ab49e1' clipsToBounds='false'>" +
            "<NSLayoutConstraint firstItem='root' firstAttribute='centerX' secondItem='parent' secondAttribute='centerX' />" +
            "<NSLayoutConstraint firstItem='root' firstAttribute='centerY' secondItem='parent' secondAttribute='centerY' constant='-50' />" +
            "<NSLayoutConstraint firstItem='root' firstAttribute='width' secondItem='parent' secondAttribute='width' multiplier='0.5' />" +
            "<NSLayoutConstraint firstItem='root' firstAttribute='height' secondItem='parent' secondAttribute='height' multiplier='0.5' />" +
            "<UILabel id='label1' text='Ohai!' enabled='true' textColor='white' textAlignment='center'/>" +
            "<NSLayoutConstraint firstItem='label1' firstAttribute='centerX' secondItem='root' secondAttribute='centerX' constant='0'/>" +
            "<NSLayoutConstraint firstItem='label1' firstAttribute='centerY' secondItem='root' secondAttribute='centerY' constant='-30'/>" +
        "</UIView>"
        
        let hostView = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 380))
        XCTAssertEqual(hostView.constraints.count, 0)
        
        let view = UIView.readFromString(xml, intoParent: hostView) as? UIView
        XCTAssertEqual(hostView.constraints.count, 4) // four constraints in root's parent
        XCTAssert(view != nil)
        XCTAssertEqual(view?.subviews.count, 1)
        XCTAssertEqual(view?.constraints.count, 2) // two constraints from label1 in root
        
        let label1 = view?.objectsWithId("label1").first as? UILabel
        XCTAssert(label1 != nil)
        XCTAssertEqual(label1?.constraints.count, 0) // none of the constraints end up here
    }
}
