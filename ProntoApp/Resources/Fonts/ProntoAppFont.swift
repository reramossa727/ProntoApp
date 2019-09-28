//
//  ProntoAppFont.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit

enum FontType {
    case regular
    case bold
    case light
    case medium
    case italic
}

class ProntoAppFont {
    
    class func roboto(_ type: FontType, size: CGFloat) -> UIFont {
        
        switch type {
        case .regular:
            return UIFont(name: "Roboto-Regular", size: size)!
        case .bold:
            return UIFont(name: "Roboto-Bold", size: size)!
        case .light:
            return UIFont(name: "Roboto-Light", size: size)!
        case .medium:
            return UIFont(name: "Roboto-Medium", size: size)!
        case .italic:
            return UIFont(name: "Roboto-Italic", size: size)!
        }
        
    }
    
}


