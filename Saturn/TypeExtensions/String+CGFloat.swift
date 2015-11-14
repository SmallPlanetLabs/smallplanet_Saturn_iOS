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
