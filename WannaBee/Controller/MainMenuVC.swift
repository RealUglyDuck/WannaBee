//
//  ViewController.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 06/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {
    
    var sideMenuConstraints: [NSLayoutConstraint] = []
    let sideMenu = SideMenu()
    
    let attributedTitle: NSMutableAttributedString = {
        
        let font = UIFont.systemFont(ofSize: 30)
        
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
        sideMenu.menuButton.addTarget(self, action: #selector(burgerButtonPressed), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hideSideMenu()
    }
    
    @objc func menuItemPressed(sender: MainMenuButton) {
        guard let title = sender.titleLabel?.text else { return }
        guard let controller = menuLinks[title] else { return }
        present(controller, animated: true, completion: nil)
    }
    
    @objc func burgerButtonPressed() {
        if sideMenu.menuIsHidden == true {
            showSideMenu()
        } else {
            hideSideMenu()
        }
    }

    func hideSideMenu() {
        let menuWidth = sideMenu.bounds.width - sideMenu.menuButton.bounds.width
        for constraint in self.sideMenuConstraints {
            if constraint.identifier == "rightAnchorConstraint" {
                let currentConstant = constraint.constant
                constraint.constant = currentConstant - menuWidth
            }
            if constraint.identifier == "leftAnchorConstraint" {
                let currentConstant = constraint.constant
                constraint.constant = currentConstant - menuWidth
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (true) in
            self.sideMenu.menuIsHidden = true
        }
    }
    
    func showSideMenu() {
        
        for constraint in self.sideMenuConstraints {
            if constraint.identifier == "rightAnchorConstraint" {
                constraint.constant = 80
            }
            if constraint.identifier == "leftAnchorConstraint" {
                constraint.constant = 0
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }) { (true) in
            self.sideMenu.menuIsHidden = false
        }
    }
    
    func setupViews() {
        
        view.addSubview(titleView)
        view.addSubview(sideMenu)
        titleView.separator.isHidden = true
        titleView.backButton.isHidden = true
        titleView.centerInTheView(centerX: view.centerXAnchor, centerY: view.centerYAnchor)

        
        sideMenuConstraints = sideMenu.constraintWithDistanceTo(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.centerXAnchor, bottom: view.bottomAnchor, topDistance: 0, leftDistance: 0, rightDistance: -80, bottomDistance: 0)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let menuTitles = ["QUESTIONS","BEFORE INTERVIEW", "INTERVIEW TIPS", "CV TIPS&TRICKS", "PRACTICE"]
    let menuLinks: [String:UIViewController] = ["QUESTIONS": QuestionsCategoriesVC(),
                                                "BEFORE INTERVIEW": UIViewController(),
                                                "INTERVIEW TIPS": InterviewTipsVC(),
                                                "CV TIPS&TRICKS": UIViewController(),
                                                "PRACTICE": UIViewController()]

    

}

