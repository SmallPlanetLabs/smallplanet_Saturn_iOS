//
//  UIControl+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/17/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIControlState : StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercaseString {
        case "normal":
            self.init(rawValue: UIControlState.Normal.rawValue)
        case "highlighted":
            self.init(rawValue: UIControlState.Highlighted.rawValue)
        case "disabled":
            self.init(rawValue: UIControlState.Disabled.rawValue)
        case "selected":
            self.init(rawValue: UIControlState.Selected.rawValue)
        case "application":
            self.init(rawValue: UIControlState.Application.rawValue)
        case "reserved":
            self.init(rawValue: UIControlState.Reserved.rawValue)
        case "focused":
            if #available(iOS 9.0, *) {
                self.init(rawValue: UIControlState.Focused.rawValue)
            } else {
                self.init(rawValue: UIControlState.Normal.rawValue)
            }
        default:
            self.init(rawValue: UIControlState.Normal.rawValue)
        }
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }

}