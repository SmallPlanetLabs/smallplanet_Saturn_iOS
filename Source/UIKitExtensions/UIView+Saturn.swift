//
//  UIView+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

extension UIView: SaturnObject {
    public func loadIntoParent(parent: SaturnObject) {
        (parent as? UIView)?.addSubview(self)
    }
    
    public func setAttribute(value: String, forProperty property: String) {
        switch property {
        case "alpha":
            if let value = value.asCGFloat {
                alpha = value
            }
        case "frame":
            frame = CGRect(stringLiteral: value)
        case "backgroundColor":
            backgroundColor = UIColor(stringLiteral: value)
        default: break
        }
    }
}
