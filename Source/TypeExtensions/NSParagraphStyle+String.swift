//
//  NSParagraphStyle+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/15/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension NSLineBreakMode: StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercased() {
        case "ByWordWrapping":
            self = byWordWrapping
        case "ByCharWrapping":
            self = byCharWrapping
        case "ByClipping":
            self = byClipping
        case "ByTruncatingHead":
            self = byTruncatingHead
        case "ByTruncatingMiddle":
            self = byTruncatingMiddle
        default:
            self = byTruncatingTail
        }
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }

}
