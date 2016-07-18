//
//  UIColor+String.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

extension UIColor {
    
    public convenience init(stringLiteral value: String) {
        var (r,g,b,a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 1.0)
        if value.hasPrefix("#") {
            let substring = value.substring(from: value.characters.index(value.startIndex, offsetBy: 1))
            var hexNumber:UInt32 = 0;
            let _ = Scanner(string: substring).scanHexInt32(&hexNumber)
            switch substring.characters.count {
            case 8:
                r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
                g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
                b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
                a = CGFloat(hexNumber & 0x000000FF) / 255.0
            case 6:
                r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
                g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
                b = CGFloat(hexNumber & 0x0000FF) / 255.0
            default: break
            }
        } else {
            switch value {
            case "red": r = 1.0
            case "green": g = 1.0
            case "blue": b = 1.0
            case "white": r = 1.0; g = 1.0; b = 1.0
            default: break
            }
        }
        self.init(red: r, green:g, blue:b, alpha:a)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed   = CGFloat(Double(red) / 255.0)
        let newGreen = CGFloat(Double(green) / 255.0)
        let newBlue  = CGFloat(Double(blue) / 255.0)
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: CGFloat(1.0))
    }
    
    public var string: String? {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        guard getRed(&r, green:&g , blue: &b, alpha: &a) else { return nil }
        let hexNumber = Int(r*255) << 24 + Int(g*255) << 16 + Int(b*255) << 8 + Int(a*255)
        return NSString(format:"#%08X", hexNumber) as String
    }

}
