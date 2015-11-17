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
        switch value.lowercaseString {
        case "left":
            self = Left
        case "right":
            self = Right
        case "top":
            self = Top
        case "bottom":
            self = Bottom
        case "leading":
            self = Leading
        case "trailing":
            self = Trailing
        case "width":
            self = Width
        case "height":
            self = Height
        case "centerx":
            self = CenterX
        case "centery":
            self = CenterY
        case "baseline":
            self = Baseline
        case "firstbaseline":
            self = FirstBaseline
        case "leftmargin":
            self = LeftMargin
        case "rightmargin":
            self = RightMargin
        case "topmargin":
            self = TopMargin
        case "bottommargin":
            self = BottomMargin
        case "leadingmargin":
            self = LeadingMargin
        case "trailingmargin":
            self = TrailingMargin
        case "centerxwithinmargins":
            self = CenterXWithinMargins
        case "centerywithinmargins":
            self = CenterYWithinMargins
        default:
            self = NotAnAttribute
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
        switch value.lowercaseString {
        case "lessthanorequal", "<=":
            self = LessThanOrEqual
        case "greaterthanorequal", ">=":
            self = GreaterThanOrEqual
        default:
            self = Equal
        }
    }

    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
}
