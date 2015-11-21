//
//  NSLayoutConstraint+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/15/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

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
        guard let attributes = attributes, first = firstItem(inEntity: parent) else { return }
        let second = secondItem(inEntity: parent)
        
        let constraints = makeConstraints(first, second: second)
        if let priority = attributes["priority"]?.asCGFloat {
            constraints.forEach { $0.priority = UILayoutPriority(priority) }
        }
        
        let constraintView: UIView
        if let constraint = constraints.first, second = constraint.secondItem as? UIView where constraint.firstItem.isDescendantOfView(second) {
            constraintView = second
        } else {
            let firstUIView = constraints.first?.firstItem as? UIView
            constraintView = firstUIView?.superview ?? firstUIView ?? first.superview ?? first
        }
        constraintView.addConstraints(constraints)
        
        if first.superview != nil {
            first.translatesAutoresizingMaskIntoConstraints = false
        }
        if let second = second where second.superview != nil {
            second.translatesAutoresizingMaskIntoConstraints = false
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
    
    private var ruleSet: String {
        return attributes?["ruleSet"] ?? ""
    }
    
    public func makeConstraints(first: UIView, second: UIView?) -> [NSLayoutConstraint] {
        guard let attributes = attributes else { return [] }
        switch ruleSet.lowercaseString {
        case "fillsuperview":
            let superview = first.superview
            return [NSLayoutConstraint(item: first, toItem: superview, equalAttribute: .Top),
                NSLayoutConstraint(item: first, toItem: superview, equalAttribute: .Right),
                NSLayoutConstraint(item: first, toItem: superview, equalAttribute: .Bottom),
                NSLayoutConstraint(item: first, toItem: superview, equalAttribute: .Left)]
        case "equalsize":
            return [NSLayoutConstraint(item: first, toItem: second, equalAttribute: .Width),
                NSLayoutConstraint(item: first, toItem: second, equalAttribute: .Height)]
        default:
            return [NSLayoutConstraint(item: first,
                attribute: NSLayoutAttribute(stringLiteral: attributes["firstAttribute"] ?? ""),
                relatedBy: NSLayoutRelation(stringLiteral: attributes["relation"] ?? ""),
                toItem: second,
                attribute: NSLayoutAttribute(stringLiteral: attributes["secondAttribute"] ?? ""),
                multiplier: attributes["multiplier"]?.asCGFloat ?? 1,
                constant: attributes["constant"]?.asCGFloat ?? 0)
            ]
        }
    }
    
}

extension NSLayoutConstraint {
    public convenience init(item: UIView, toItem: UIView?, equalAttribute attribute: NSLayoutAttribute) {
        self.init(item: item, attribute: attribute, relatedBy:.Equal, toItem:toItem, attribute: attribute, multiplier: 1, constant: 0)
    }
}
