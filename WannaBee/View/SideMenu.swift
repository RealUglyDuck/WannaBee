//
//  SideMenu.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 28/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class SideMenu: UIView {

    let menuButton = BurgerButton()
    public var menuIsHidden = true
    
    let menuButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()
    
    let menuBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCollection.mainColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(menuBackgroundView)
        addSubview(menuButton)
        menuBackgroundView.addSubview(menuButtonsStack)
        
        menuBackgroundView.constraintsTo(top: topAnchor, leading: leadingAnchor, trailing: menuButton.leadingAnchor, bottom: bottomAnchor)
        
        menuButton.constraintsTo(top: topAnchor, leading: nil, trailing: trailingAnchor, bottom: nil)
        
        _ = menuButtonsStack.constraintWithDistanceTo(top: menuBackgroundView.topAnchor, leading: menuBackgroundView.leadingAnchor, trailing: menuBackgroundView.trailingAnchor, bottom: menuBackgroundView.centerYAnchor, topDistance: 60, leftDistance: 20, rightDistance: 20, bottomDistance: 0)
        
        for title in menuTitles {
            let button = MainMenuButton(title: title)
            button.titleLabel?.textAlignment = .left
            menuButtonsStack.addArrangedSubview(button)
        }
        
        
    }
    
    let menuTitles = ["QUESTIONS","BEFORE INTERVIEW", "INTERVIEW TIPS", "CV TIPS&TRICKS", "PRACTICE"]
    let menuLinks: [String:UIViewController] = ["QUESTIONS": QuestionsCategoriesVC(),
                                                "BEFORE INTERVIEW": UIViewController(),
                                                "INTERVIEW TIPS": InterviewTipsVC(),
                                                "CV TIPS&TRICKS": UIViewController(),
                                                "PRACTICE": UIViewController()]
}
