//
//  UIDummy.swift
//  Test
//
//  Created by Ankish Jain on 28/08/18.
//  Copyright © 2018 Appyog. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class func brandonRegular(size: CGFloat) -> UIFont! {
        return UIFont(name: "BrandonText-Regular", size: size)!
    }
    
    class func brandonBold(size: CGFloat) -> UIFont! {
        return UIFont(name: "BrandonText-Bold", size: size)!
    }
}

extension UIColor {
    class func paleGreen() -> UIColor {
        return UIColor(red: 0/255, green: 191/255, blue: 165/255, alpha: 1.0)
    }
    
    class func charCoal() -> UIColor {
        return UIColor(red: 46/255, green: 50/255, blue: 61/255, alpha: 1.0)
    }
    
}

