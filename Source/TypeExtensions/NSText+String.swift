//
//  NSText+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/15/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension NSTextAlignment: StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character

    public init(stringLiteral value: String) {
        switch value.lowercaseString {
        case "center":
            self = Center
        case "Right":
            self = Right
        case "Justified":
            self = Justified
        case "Natural":
            self = Natural
        default:
            self = Left
        }
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }

}