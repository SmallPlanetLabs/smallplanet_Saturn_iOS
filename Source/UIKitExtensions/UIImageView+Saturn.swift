//
//  UIImageView+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/16/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

extension UIImageView {
    override public func setAttribute(value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property {
        case "image":
            image = UIImage(stringLiteral: value)
        case "highlightedImage":
            highlightedImage = UIImage(stringLiteral: value)
        default: break
        }
    }
}