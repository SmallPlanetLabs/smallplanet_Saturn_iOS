//
//  NSLayoutConstraint+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/15/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

extension NSLayoutConstraint {
    
    private struct AssociatedKeys {
        static var attributes = "SaturnAssociatedKey:attributes"
    }

    public var attributes: [String:String]? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.attributes) as? [String:String]
        }
    }

    public override func setAttributes(attributes:[String:String]?) {
        guard let attributes = attributes else { return }
        objc_setAssociatedObject(self, &AssociatedKeys.attributes, attributes, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    public override func loadIntoParent(parent: AnyObject) {
        guard let attributes = attributes, firstItem = firstItem(inEntity: parent) else { return }
        let second = secondItem(inEntity: parent)
        let constraint = NSLayoutConstraint(item: firstItem,
            attribute: NSLayoutAttribute(stringLiteral: attributes["firstAttribute"] ?? ""),
            relatedBy: NSLayoutRelation(stringLiteral: attributes["relation"] ?? ""),
            toItem: second,
            attribute: NSLayoutAttribute(stringLiteral: attributes["secondAttribute"] ?? ""),
            multiplier: attributes["multiplier"]?.asCGFloat ?? 1,
            constant: attributes["constant"]?.asCGFloat ?? 0)
        let constraintView = second != nil && firstItem.isDescendantOfView(second!) ? second! : firstItem
        constraintView.addConstraint(constraint)
        if firstItem.superview != nil {
            firstItem.translatesAutoresizingMaskIntoConstraints = false
        }
        if let secondItem = constraint.secondItem as? UIView where secondItem.superview != nil {
            secondItem.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    func item(withId id: String?, inEntity entity: AnyObject) -> UIView? {
        guard let id = id, entity = entity as? SaturnObject else { return nil }
        return ((entity as? UIView)?.superview ?? entity).objectsWithId(id).last as? UIView
    }
    
    func firstItem(inEntity entity: AnyObject) -> UIView? {
        guard let firstItemId = attributes?["firstItem"] else { return nil }
        if firstItemId == "parent" {
            return secondItem(inEntity: entity)?.superview
        }
        return item(withId: firstItemId, inEntity: entity)
    }
    
    func secondItem(inEntity entity: AnyObject) -> UIView? {
        guard let secondItemId = attributes?["secondItem"] else { return nil }
        if secondItemId == "parent" {
            return firstItem(inEntity: entity)?.superview
        }
        return item(withId: secondItemId, inEntity: entity)
    }
    
}