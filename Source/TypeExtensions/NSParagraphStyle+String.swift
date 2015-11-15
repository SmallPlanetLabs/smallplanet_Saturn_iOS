//
//  NSParagraphStyle+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/15/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

extension NSLineBreakMode: StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercaseString {
        case "ByWordWrapping":
            self = ByWordWrapping
        case "ByCharWrapping":
            self = ByCharWrapping
        case "ByClipping":
            self = ByClipping
        case "ByTruncatingHead":
            self = ByTruncatingHead
        case "ByTruncatingMiddle":
            self = ByTruncatingMiddle
        default:
            self = ByTruncatingTail
        }
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }

}