//
//  NSObject+Saturn.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

extension NSObject: SaturnObject {
    
    private struct AssociatedKeys {
        static var id = "SaturnAssociatedKey:id"
    }
    
    public func loadIntoParent(parent: AnyObject) {
        
    }
    
    public func setAttribute(value: String, forProperty property:String) {
        switch property {
        case "id":
            id = value
        default: break
        }
    }
    
    public var id: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.id) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.id, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func objectsWithId(id: String) -> [SaturnObject] {
        return []
    }

}