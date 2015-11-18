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
    
    // Provides bitwise OptionSetType functionality such that "highlighted,selected" is
    // equivalent to [.Highlighted, .Selected]
    public init(stringLiteral value: String) {
        func stateForString(value: String) -> UIControlState {
            switch value.lowercaseString {
            case "normal":
                return .Normal
            case "highlighted":
                return .Highlighted
            case "disabled":
                return .Disabled
            case "selected":
                return .Selected
            case "application":
                return .Application
            case "reserved":
                return .Reserved
            case "focused":
                if #available(iOS 9.0, *) {
                    return .Focused
                }
            default: break
            }
            return .Normal
        }

        let state = value.componentsSeparatedByString(",").reduce(UIControlState()) { $0.union(stateForString($1)) }
        self.init(rawValue: state.rawValue)
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
}