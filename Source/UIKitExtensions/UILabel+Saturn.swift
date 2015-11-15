//
//  UILabel+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import UIKit

// overriding SaturnObject protocol conformance
extension UILabel {
    override public func setAttribute(value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property {
        case "text":
            text = value
        case "textColor":
            textColor = UIColor(stringLiteral: value)
        case "enabled":
            enabled = Bool(stringLiteral: value)
        default: break
        }
    }
}