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
        func stateForString(_ value: String) -> UIControlState {
            switch value.lowercased() {
            case "normal":
                return UIControlState()
            case "highlighted":
                return .highlighted
            case "disabled":
                return .disabled
            case "selected":
                return .selected
            case "application":
                return .application
            case "reserved":
                return .reserved
            case "focused":
                if #available(iOS 9.0, *) {
                    return .focused
                }
            default: break
            }
            return UIControlState()
        }

        let state = value.components(separatedBy: ",").reduce(UIControlState()) { $0.union(stateForString($1)) }
        self.init(rawValue: state.rawValue)
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: "\(value)")
    }
    
}


extension UIControlContentVerticalAlignment : StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercased() {
        case "fill":
            self = fill
        case "top":
            self = top
        case "bottom":
            self = bottom
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


extension UIControlContentHorizontalAlignment : StringLiteralConvertible {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = Character
    
    public init(stringLiteral value: String) {
        switch value.lowercased() {
        case "fill":
            self = fill
        case "left":
            self = left
        case "right":
            self = right
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
