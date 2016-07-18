//
//  UIImage+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/16/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIImage {
    
    public convenience init?(stringLiteral value: String) {
        if value.range(of: ":/") != nil {
            self.init(contentsOfFile:(String(bundlePath: value)))
        } else {
            self.init(named: value)
        }
    }
    
}
