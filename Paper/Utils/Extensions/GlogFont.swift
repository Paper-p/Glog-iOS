//
//  GlogFont.swift
//  Paper
//
//  Created by 선민재 on 2022/11/16.
//

import UIKit

extension UIFont {
    
    enum Family: String {
        case Bold, ExtraBold, SemiBold, Medium, Regular
    }
    
    static func GlogFont(size: CGFloat = 10, family: Family = .Regular) -> UIFont {
        return UIFont(name: "Pretendard-\(family)", size: size)!
    }
}
