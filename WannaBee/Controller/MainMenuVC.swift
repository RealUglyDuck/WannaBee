//
//  ViewController.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 06/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {
    
    let attributedTitle: NSMutableAttributedString = {
        
        let font = FontsCollection.titleFont
        
        let firstAttributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: ColorCollection.textColor]
        let secondAttributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: ColorCollection.mainColor]

        let logoAttachment = NSTextAttachment()
        let image = UIImage(named: "Wannabeelogo")
        logoAttachment.image = image
        logoAttachment.bounds = CGRect(x: 0, y: 0, width: Sizes.logoWidth, height: Sizes.logoHeight)
        let firstString = NSMutableAttributedString(string: "WANNA", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "BEE  ", attributes: secondAttributes)
        let thirdString = NSAttributedString(attachment: logoAttachment)

        firstString.append(secondString)
        firstString.append(thirdString)
        
        return firstString
    }()
    
    lazy var titleView = TitleView(title: attributedTitle)
    
    let menuButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorCollection.backgroundColor
        setupViews()
        print("width: \(UIScreen.main.bounds.width), height: \(UIScreen.main.bounds.height)")
    }
    
    @objc func menuItemPressed(sender: MainMenuButton) {
        guard let title = sender.titleLabel?.text else { return }
        guard let controller = menuLinks[title] else { return }
        present(controller, animated: true, completion: nil)
    }

    
    func setupViews() {
        view.addSubview(titleView)
        view.addSubview(menuButtonsStack)
        
        _ = titleView.constraintsTo(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil)
        
        titleView.setSize(width: nil, height: view.bounds.height / Sizes.titleViewScale)
        
        _ = menuButtonsStack.constraintWithDistanceTo(top: titleView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, topDistance: 60, leftDistance: 20, rightDistance: 20, bottomDistance: 100)
        
        for index in menuTitles.indices {
            let button = MainMenuButton(title: menuTitles[index])
            button.addTarget(self, action: #selector(menuItemPressed(sender:)), for: .touchUpInside)
            menuButtonsStack.addArrangedSubview(button)
        }
        
        titleView.backButton.isHidden = true
    }
    
    let menuTitles = ["QUESTIONS","BEFORE INTERVIEW", "INTERVIEW TIPS", "CV TIPS&TRICKS", "PRACTICE"]
    let menuLinks: [String:UIViewController] = ["QUESTIONS": QuestionsCategoriesVC(),
                                                "BEFORE INTERVIEW": UIViewController(),
                                                "INTERVIEW TIPS": InterviewTipsVC(),
                                                "CV TIPS&TRICKS": UIViewController(),
                                                "PRACTICE": UIViewController()]

    

}

