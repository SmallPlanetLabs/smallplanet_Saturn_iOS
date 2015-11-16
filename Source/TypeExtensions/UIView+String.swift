//
//  UIView+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/16/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

extension UIViewContentMode: StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercaseString {
        case "scaletofill":
            self = ScaleToFill
        case "scaleaspectfit":
            self = ScaleAspectFit
        case "scaleaspectfill":
            self = ScaleAspectFill
        case "redraw":
            self = Redraw
        case "center":
            self = Center
        case "top":
            self = Top
        case "bottom":
            self = Bottom
        case "left":
            self = Left
        case "right":
            self = Right
        case "topleft":
            self = TopLeft
        case "topright":
            self = TopRight
        case "bottomleft":
            self = BottomLeft
        case "bottomright":
            self = BottomRight
        default:
            self = Center
        }
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
}
