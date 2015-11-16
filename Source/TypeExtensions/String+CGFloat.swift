//
//  String+CGFloat.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

public extension String {
    var asCGFloat: CGFloat? {
        return NSNumberFormatter().numberFromString(self).map{CGFloat($0)}
    }
}

// String(bundlePath:) allows creating file paths for resources in different locations
//    "bundle://image.png" returns a file in the main bundle
//    "documents://data.dat" returns a file in the documents directory
//    "cache://stuff.tmp" returns a file in the cache directory
//    "background" passes through "background" without modification
public extension String {
    public init(bundlePath:String) {
        self.init()
        let pathComponents = bundlePath.componentsSeparatedByString(":/")
        switch pathComponents[0] {
        case "bundle":
            if let resourcePath = NSBundle.mainBundle().resourcePath {
                self = NSString(string: resourcePath).stringByAppendingPathComponent(pathComponents[1])
            }
        case "documents":
            let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
            self = NSString(string: documentsPath).stringByAppendingPathComponent(pathComponents[1])
        case "cache":
            let cachePath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0]
            self = NSString(string: cachePath).stringByAppendingPathComponent(pathComponents[1])
        default:
            self = bundlePath
        }
    }
}