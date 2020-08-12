//
//  UIColor+P1.swift
//  P1_Swift
//
//  Created by 서민주 on 2020/08/05.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import UIKit

enum AssetsColor {
    // Main Color
    case mainColor
    
    // Button Color
    case defaultGrayColor
    case darkGrayColor
    
    // Division Line Color
    case divisionLineColor
    
    // Cell Color
    case selectedCellMintColor
    case selectedCellGrayColor
    
    // Dark BG Color
    case darkBgColor
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor {
        switch name {
        case .mainColor:
            return #colorLiteral(red: 0.1072049513, green: 0.3422587216, blue: 0.8501373529, alpha: 1)
        case .defaultGrayColor:
            return #colorLiteral(red: 0.9175767303, green: 0.9176867604, blue: 0.9175391197, alpha: 1)
        case .darkGrayColor:
            return #colorLiteral(red: 0.5999391079, green: 0.6000427008, blue: 0.5999254584, alpha: 1)
        case .divisionLineColor:
            return #colorLiteral(red: 0.7744807005, green: 0.7698782086, blue: 0.7780196071, alpha: 1)
        case .selectedCellMintColor:
            return #colorLiteral(red: 0.3098039216, green: 0.7137254902, blue: 0.7607843137, alpha: 1)
        case .selectedCellGrayColor:
            return #colorLiteral(red: 0.9384746552, green: 0.9328956604, blue: 0.9427630305, alpha: 1)
        case .darkBgColor:
            return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        }
    }
}
