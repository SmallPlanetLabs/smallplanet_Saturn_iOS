//
//  UIScrollView+Saturn.swift
//  Saturn
//
//  Created by Michael Shin on 11/20/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIScrollView {
    override public func setAttribute(_ value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property {
        case "contentOffset":
            contentOffset = CGPoint(stringLiteral: value)
        case "contentSize":
            contentSize = CGSize(stringLiteral: value)
        case "scrollEnabled":
            isScrollEnabled = Bool(stringLiteral: value)
        case "directionalLockEnabled":
            isDirectionalLockEnabled = Bool(stringLiteral: value)
        case "scrollsToTop":
            scrollsToTop = Bool(stringLiteral: value)
        case "pagingEnabled":
            isPagingEnabled = Bool(stringLiteral: value)
        case "bounces":
            bounces = Bool(stringLiteral: value)
        case "alwaysBounceVertical":
            alwaysBounceVertical = Bool(stringLiteral: value)
        case "alwaysBounceHorizontal":
            alwaysBounceHorizontal = Bool(stringLiteral: value)
        case "delaysContentTouches":
            delaysContentTouches = Bool(stringLiteral: value)
        case "decelerationRate":
            if let value = value.asCGFloat {
                decelerationRate = value;
            }
        case "showsHorizontalScrollIndicator":
            showsHorizontalScrollIndicator = Bool(stringLiteral: value)
        case "showsVerticalScrollIndicator":
            showsVerticalScrollIndicator = Bool(stringLiteral: value)
        default: break
        }
    }
}

// TODO: contentInset, scrollIndicatorInsets - UIEdgeInsets
