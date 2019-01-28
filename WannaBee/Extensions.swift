//
//  Extensions.swift
//  PrivateChat
//
//  Created by Paweł Ambrożej on 27/08/2018.
//  Copyright © 2018 Pawel Ambrozej. All rights reserved.
//

import Foundation

import UIKit



class RoundedCornerButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.cornerRadius = 25
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
    
    convenience init(buttonTitle: String) {
        self.init(frame: .zero)
        setTitle(buttonTitle, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class TextButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
    }
    
    convenience init(buttonTitle: String) {
        self.init(frame: .zero)
        setTitle(buttonTitle, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}





extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b:CGFloat, alpha: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
