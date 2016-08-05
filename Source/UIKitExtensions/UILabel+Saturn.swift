//
//  UILabel+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

// overriding SaturnObject protocol conformance
extension UILabel {
    override public func setAttribute(_ value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property {
        case "text":
            text = value
        case "textColor":
            textColor = UIColor(stringLiteral: value)
        case "textAlignment":
            textAlignment = NSTextAlignment(stringLiteral: value)
        case "enabled":
            isEnabled = Bool(stringLiteral: value)
        case "lineBreakMode":
            lineBreakMode = NSLineBreakMode(stringLiteral: value)
        case "numberOfLines":
            if let value = Int(value) {
                numberOfLines = value
            }
        case "minimumScaleFactor":
            if let value = value.asCGFloat {
                minimumScaleFactor = value
            }
        case "adjustsFontSizeToFitWidth":
            adjustsFontSizeToFitWidth = Bool(stringLiteral: value)
        default: break
        }
    }
    
    override public func setAttributes(_ attributes: [String : String]?) {
        super.setAttributes(attributes)
        guard let attributes = attributes else { return }
        let fontSize: CGFloat
        if let fontSizeString = attributes["fontSize"], let size = fontSizeString.asCGFloat {
            fontSize = size
        } else {
            fontSize = UIFont.systemFontSize
        }
        if let fontName = attributes["fontName"] {
            font = UIFont(name: fontName, size: fontSize)
        } else {
            font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}
