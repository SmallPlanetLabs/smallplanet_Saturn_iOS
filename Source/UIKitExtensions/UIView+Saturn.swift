//
//  UIView+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIView {
    
    public override func loadIntoParent(parent: AnyObject) {
        (parent as? UIView)?.addSubview(self)
    }
    
    public override func setAttribute(value: String, forProperty property: String) {
        super.setAttribute(value, forProperty: property)
        switch property {
        case "alpha":
            if let value = value.asCGFloat {
                alpha = value
            }
        case "frame":
            frame = CGRect(stringLiteral: value)
        case "backgroundColor":
            backgroundColor = UIColor(stringLiteral: value)
        case "clipsToBounds":
            clipsToBounds = Bool(stringLiteral: value)
        case "contentMode":
            contentMode = UIViewContentMode(stringLiteral: value)
        default: break
        }
    }
    
    override public func objectsWithId(id: String) -> [AnyObject] {
        var objects = subviews.reduce([]) { $0 + $1.objectsWithId(id) }
        if id == self.id {
            objects.append(self)
        }
        return objects
    }

}
