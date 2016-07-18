//
//  UIButtonState.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/16/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

@objc public class UIButtonState : NSObject {
    var state: String?
    var image: String?
    var backgroundImage: String?
    var title: String?
    var titleColor: String?
    var titleShadowColor: String?
    
    public override func loadIntoParent(_ parent: AnyObject) {
        guard let button = parent as? UIButton else {
            assertionFailure("UIButtonState can only be a child of a UIButton")
            return
        }
        guard let state = state else {
            assertionFailure("UIButtonState must have a control state")
            return
        }
        let controlState = UIControlState(stringLiteral: state)

        if let image = image {
            button.setImage(UIImage(stringLiteral: image), for: controlState)
        }
        if let backgroundImage = backgroundImage {
            button.setBackgroundImage(UIImage(stringLiteral: backgroundImage), for: controlState)
        }
        if let title = title {
            button.setTitle(title, for: controlState)
        }
        if let titleColor = titleColor {
            button.setTitleColor(UIColor(stringLiteral: titleColor), for: controlState)
        }
        if let titleShadowColor = titleShadowColor {
            button.setTitleShadowColor(UIColor(stringLiteral: titleShadowColor), for: controlState)
        }
    }
    
    public override func setAttribute(_ attribute: String, forProperty property: String) {
        switch property.lowercased() {
        case "state":
            state = attribute
        case "image":
            image = attribute
        case "backgroundimage":
            backgroundImage = attribute
        case "title":
            title = attribute
        case "titlecolor":
            titleColor = attribute
        case "titleshadowcolor":
            titleShadowColor = attribute
        default: break
        }
    }
    
}
