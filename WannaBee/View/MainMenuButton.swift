//
//  MainMenuButton.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 06/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class MainMenuButton: UIButton {

    let buttonHeight: CGFloat = 50
    let buttonFont = FontsCollection.menuFont
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.font = buttonFont
        setTitleColor(ColorCollection.textColor, for: .normal)
        contentHorizontalAlignment = .left
    }
    
    convenience init(title: String) {
        self.init(frame: CGRect.zero)
        setTitle(title, for: .normal)
        
    }
    
    convenience init(title: NSMutableAttributedString) {
        self.init(frame: CGRect.zero)
    }
    
    func setupViews() {
        setSize(width: nil, height: buttonHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
