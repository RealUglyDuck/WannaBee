//
//  Constants.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 06/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import Foundation
import UIKit

enum ColorCollection {
//    static let backgroundColor  = UIColor(r: 20, g: 20, b: 20, alpha: 1)
//    static let mainColor        = UIColor(r: 233, g: 163, b: 64, alpha: 1)
//    static let textColor        = UIColor(r: 255, g: 255, b: 255, alpha: 1)
    static let backgroundColor  = UIColor(r: 0, g: 0, b: 0, alpha: 1)
    static let mainColor        = UIColor(r: 233, g: 163, b: 64, alpha: 1)
    static let textColor        = UIColor(r: 255, g: 255, b: 255, alpha: 1)
}

enum FontsCollection {
    static let titleFont = UIFontMetrics.default.scaledFont(for: UIFont(name: "HelveticaNeue-Light", size: 40) ?? UIFont.systemFont(ofSize: 30))
    static let menuFont = UIFontMetrics.default.scaledFont(for: UIFont(name: "HelveticaNeue-Light", size: UIScreen.main.bounds.height / FontScale.divider) ?? UIFont.systemFont(ofSize: 12))
}

enum Sizes {
    static let scaleFactor: CGFloat     = UIScreen.main.bounds.height / UIScreen.main.bounds.width
    static let logoWidth: CGFloat       = UIScreen.main.bounds.height/20
    static let logoHeight: CGFloat      = Sizes.logoWidth * 72 / 88
    static let titleViewScale: CGFloat  = 7
}

enum ImageDatabase {
    static let logoImage: String = "Wannabeelogo"
    static let generalButtonImage: String = "generalIcon"
}


enum FontScale {
    static let divider: CGFloat = {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        if width/height < 0.5 {
            return 40
        } else {
            return 35
        }
    }()
}
