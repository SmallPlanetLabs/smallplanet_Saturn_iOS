//
//  UIControl+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/18/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIControl {
    override public func setAttribute(_ value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property.lowercased() {
        case "enabled":
            isEnabled = Bool(stringLiteral: value)
        case "selected":
            isSelected = Bool(stringLiteral: value)
        case "highlighted":
            isHighlighted = Bool(stringLiteral: value)
        case "contentverticalalignment":
            contentVerticalAlignment = UIControlContentVerticalAlignment(stringLiteral: value)
        case "contenthorizontalalignment":
            contentHorizontalAlignment = UIControlContentHorizontalAlignment(stringLiteral: value)
        default:
            break
        }
    }
}
