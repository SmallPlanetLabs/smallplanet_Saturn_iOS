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

    public override func setAttributes(_ attributes:[String:String]?) {
        guard let attributes = attributes else { return }
        objc_setAssociatedObject(self, &AssociatedKeys.attributes, attributes, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    public override func loadIntoParent(_ parent: AnyObject) {
        guard let attributes = attributes, first = firstItem(inEntity: parent) else { return }
        let second = secondItem(inEntity: parent)
        
        let constraints = makeConstraints(first, second: second)
        if let priority = attributes["priority"]?.asCGFloat {
            constraints.forEach { $0.priority = UILayoutPriority(priority) }
        }
        
        let constraintView: UIView
        if let constraint = constraints.first, second = constraint.secondItem as? UIView where constraint.firstItem.isDescendant(of: second) {
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
    
    public func makeConstraints(_ first: UIView, second: UIView?) -> [NSLayoutConstraint] {
        guard let attributes = attributes else { return [] }
        switch ruleSet.lowercased() {
        case "fillsuperview":
            let superview = first.superview
            return [NSLayoutConstraint(item: first, toItem: superview, equalAttribute: .top),
                NSLayoutConstraint(item: first, toItem: superview, equalAttribute: .right),
                NSLayoutConstraint(item: first, toItem: superview, equalAttribute: .bottom),
                NSLayoutConstraint(item: first, toItem: superview, equalAttribute: .left)]
        case "equalsize":
            return [NSLayoutConstraint(item: first, toItem: second, equalAttribute: .width),
                NSLayoutConstraint(item: first, toItem: second, equalAttribute: .height)]
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
        self.init(item: item, attribute: attribute, relatedBy:.equal, toItem:toItem, attribute: attribute, multiplier: 1, constant: 0)
    }
}
