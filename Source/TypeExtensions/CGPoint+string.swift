//
//  CGPoint+string.swift
//  Saturn
//
//  Created by Michael Shin on 11/20/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension CGPoint: ExpressibleByStringLiteral {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        let (x, y) = CGPoint.componentsFromString(value)
        self.init(x: x, y: y)
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
    public static func componentsFromString(_ string: String) -> (CGFloat, CGFloat) {
        var x:Float = 0.0, y:Float = 0.0
        var components = string.components(separatedBy: ",")
        if components.count == 2 {
            x = (components[0] as NSString).floatValue
            y = (components[1] as NSString).floatValue
        }
        return (CGFloat(x), CGFloat(y))
    }
}

