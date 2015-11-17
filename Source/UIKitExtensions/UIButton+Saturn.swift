//
//  UIButton+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/17/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIButton {
    override public func setAttribute(value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property.lowercaseString {
        case "enabled":
            enabled = Bool(stringLiteral: value)
        case "selected":
            selected = Bool(stringLiteral: value)
        case "highlighted":
            highlighted = Bool(stringLiteral: value)
        case "showstouchwhenhighlighted":
            showsTouchWhenHighlighted = Bool(stringLiteral: value)
        case "adjustsimagewhenhighlighted":
            adjustsImageWhenHighlighted = Bool(stringLiteral: value)
        case "adjustsimagewhendisabled":
            adjustsImageWhenDisabled = Bool(stringLiteral: value)
        default:
            break
        }
    }
}