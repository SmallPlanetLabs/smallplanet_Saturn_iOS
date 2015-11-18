//
//  UIControl+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/18/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIControl {
    override public func setAttribute(value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property.lowercaseString {
        case "enabled":
            enabled = Bool(stringLiteral: value)
        case "selected":
            selected = Bool(stringLiteral: value)
        case "highlighted":
            highlighted = Bool(stringLiteral: value)
        case "contentverticalalignment":
            contentVerticalAlignment = UIControlContentVerticalAlignment(stringLiteral: value)
        case "contenthorizontalalignment":
            contentHorizontalAlignment = UIControlContentHorizontalAlignment(stringLiteral: value)
        default:
            break
        }
    }
}