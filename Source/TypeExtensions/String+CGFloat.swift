//
//  String+CGFloat.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

public extension String {
    var asCGFloat: CGFloat? {
        return NumberFormatter().number(from: self).map{CGFloat($0)}
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
        let pathComponents = bundlePath.components(separatedBy: ":/")
        switch pathComponents[0] {
        case "bundle":
            if let resourcePath = Bundle.main.resourcePath {
                self = NSString(string: resourcePath).appendingPathComponent(pathComponents[1])
            }
        case "documents":
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            self = NSString(string: documentsPath).appendingPathComponent(pathComponents[1])
        case "cache":
            let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
            self = NSString(string: cachePath).appendingPathComponent(pathComponents[1])
        default:
            self = bundlePath
        }
    }
}
