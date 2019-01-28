//
//  ButtonsStack.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 17/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class ButtonsStack: UIStackView {

    let columnCount = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        alignment = .fill
        distribution = .fillEqually
        axis = .vertical
        spacing = 50
    }
    
    convenience init(buttons: [UIButton]) {
        self.init()
        createGrid(from: buttons)
    }
    
    func createGrid(from buttons: [UIButton]) {
        let numberOfRows = buttons.count / columnCount
        
        for row in 0..<numberOfRows {
            let stackView = UIStackView()
            stackView.alignment = .center
            stackView.distribution = .fillEqually
            for column in 0..<columnCount {
                stackView.addArrangedSubview(buttons[column + (columnCount * row)])
                
            }
            addArrangedSubview(stackView)
        }
        if buttons.count%2 != 0 {
            guard let lastButton = buttons.last else { return }
            addArrangedSubview(lastButton)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
