//
//  CGSize+String.swift
//  Saturn
//
//  Created by Michael Shin on 11/20/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension CGSize: StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        let (w, h) = CGSize.componentsFromString(value)
        self.init(width: w, height: h)
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
    public static func componentsFromString(string: String) -> (CGFloat, CGFloat) {
        var w:Float = 0.0, h:Float = 0.0
        var components = string.componentsSeparatedByString(",")
        if components.count == 2 {
            w = (components[0] as NSString).floatValue
            h = (components[1] as NSString).floatValue
        }
        return (CGFloat(w), CGFloat(h))
    }
}
