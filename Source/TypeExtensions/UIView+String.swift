//
//  UIView+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/16/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIViewContentMode: StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercased() {
        case "scaletofill":
            self = scaleToFill
        case "scaleaspectfit":
            self = scaleAspectFit
        case "scaleaspectfill":
            self = scaleAspectFill
        case "redraw":
            self = redraw
        case "center":
            self = center
        case "top":
            self = top
        case "bottom":
            self = bottom
        case "left":
            self = left
        case "right":
            self = right
        case "topleft":
            self = topLeft
        case "topright":
            self = topRight
        case "bottomleft":
            self = bottomLeft
        case "bottomright":
            self = bottomRight
        default:
            self = center
        }
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
}
