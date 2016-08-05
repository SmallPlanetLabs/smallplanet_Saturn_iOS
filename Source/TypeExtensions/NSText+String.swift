//
//  NSText+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/15/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension NSTextAlignment: ExpressibleByStringLiteral {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character

    public init(stringLiteral value: String) {
        switch value.lowercased() {
        case "center":
            self = .center
        case "Right":
            self = .right
        case "Justified":
            self = .justified
        case "Natural":
            self = .natural
        default:
            self = .left
        }
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }

}
