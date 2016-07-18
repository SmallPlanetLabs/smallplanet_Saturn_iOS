//
//  NSLayoutConstraint+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/15/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension NSLayoutAttribute: StringLiteralConvertible {
    
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercased() {
        case "left":
            self = left
        case "right":
            self = right
        case "top":
            self = top
        case "bottom":
            self = bottom
        case "leading":
            self = leading
        case "trailing":
            self = trailing
        case "width":
            self = width
        case "height":
            self = height
        case "centerx":
            self = centerX
        case "centery":
            self = centerY
        case "lastBaseline":
            self = lastBaseline
        case "firstbaseline":
            self = firstBaseline
        case "leftmargin":
            self = leftMargin
        case "rightmargin":
            self = rightMargin
        case "topmargin":
            self = topMargin
        case "bottommargin":
            self = bottomMargin
        case "leadingmargin":
            self = leadingMargin
        case "trailingmargin":
            self = trailingMargin
        case "centerxwithinmargins":
            self = centerXWithinMargins
        case "centerywithinmargins":
            self = centerYWithinMargins
        default:
            self = notAnAttribute
        }
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }

}

extension NSLayoutRelation : StringLiteralConvertible {
    
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercased() {
        case "lessthanorequal", "<=":
            self = lessThanOrEqual
        case "greaterthanorequal", ">=":
            self = greaterThanOrEqual
        default:
            self = equal
        }
    }

    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
}
