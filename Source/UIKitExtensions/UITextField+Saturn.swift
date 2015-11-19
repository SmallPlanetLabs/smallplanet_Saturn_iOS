//
//  UITextField+Saturn.swift
//  Saturn
//
//  Created by Michael Shin on 11/19/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UITextField {
    override public func setAttribute(value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property {
        case "text":
            text = value
        case "placeholder":
            placeholder = value
        case "textColor":
            textColor = UIColor(stringLiteral: value)
        case "textAlignment":
            textAlignment = NSTextAlignment(stringLiteral: value)
        case "adjustsFontSizeToFitWidth":
            adjustsFontSizeToFitWidth = Bool(stringLiteral: value)
        case "minimumFontSize":
            if let value = value.asCGFloat {
                minimumFontSize = value
            }
        default: break
        }
    }
}