//
//  ProntoAppColor.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

struct ProntoAppColor {
    
    //static var pink: UIColor { return UIColorFromRGB(0xc10094)}
    static var pink: UIColor { return UIColorFromHEX("3E93D9")}
    static var grayBorder: UIColor { return UIColorFromHEX("E9E7E7")}
    static var black: UIColor { return UIColorFromRGB(0x00000)}
    static var blue: UIColor { return UIColorFromRGB(0x007AFF)}
    static var error: UIColor { return UIColorFromRGB(0xee3939) }
    static var pinkDisable: UIColor { return UIColorFromHEX("E10098") }
    static var successGreen: UIColor { return UIColor.init(red: 75/255, green: 181/255, blue: 67/255, alpha: 1.0) }
    static var systemBlue: UIColor { return UIColor.init(red: 53/255, green: 131/255, blue: 247/255, alpha: 1.0) }
    
    static func UIColorFromHEX(_ hex: String) -> UIColor {
        
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func UIColorFromRGB(_ rgbValue: UInt, alpha: Double) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    static func UIColorFromRGB(_ wmcolor: UIColor, alpha: Double) -> UIColor {
        return wmcolor.withAlphaComponent(CGFloat(alpha))
    }
    
    
}

