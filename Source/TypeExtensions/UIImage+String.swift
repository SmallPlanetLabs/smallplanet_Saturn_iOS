//
//  UIImage+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/16/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

extension UIImage {
    
    public convenience init?(stringLiteral value: String) {
        if value.rangeOfString(":/") != nil {
            self.init(contentsOfFile:(String(bundlePath: value)))
        } else {
            self.init(named: value)
        }
    }
    
}
