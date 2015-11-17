//
//  CGRect+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension CGRect: StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        let (origin, size) = CGRect.componentsFromString(value)
        self.init(origin: origin, size: size)
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
    public static func componentsFromString(string: String) -> (CGPoint, CGSize) {
        var x:Float=0.0, y:Float=0.0, w:Float=0.0, h:Float=0.0
        var components = string.componentsSeparatedByString(",")
        if components.count == 4 {
            x = (components[0] as NSString).floatValue
            y = (components[1] as NSString).floatValue
            w = (components[2] as NSString).floatValue
            h = (components[3] as NSString).floatValue
        }
        let origin = CGPoint(x: CGFloat(x), y: CGFloat(y))
        let size = CGSize(width: CGFloat(w), height: CGFloat(h))
        return (origin, size)
    }
}
