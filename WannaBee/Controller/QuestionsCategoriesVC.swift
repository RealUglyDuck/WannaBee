//
//  QuestionsCategoriesVC.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 09/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class QuestionsCategoriesVC: UIViewController {

    let titleView = TitleView(title: "QUESTIONS")
    
    let logo: UIImageView = {
        let image = UIImage(named: ImageDatabase.logoImage)
        let logoView = UIImageView(image: image)
        logoView.contentMode = .scaleAspectFit
        return logoView
    }()
    
    let horizontalStackView:  UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 50
        return stack
    }()
    
    let button1 = PolygonButton(imageName: ImageDatabase.generalButtonImage, buttonTitle: "General")
    let button2 = PolygonButton(imageName: ImageDatabase.generalButtonImage, buttonTitle: "Retail")
    let button3 = PolygonButton(imageName: ImageDatabase.generalButtonImage, buttonTitle: "Retail")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        titleView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        view.backgroundColor = ColorCollection.backgroundColor
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews() {
        view.addSubview(titleView)
        view.addSubview(logo)
        view.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(button1)
        horizontalStackView.addArrangedSubview(button2)
        verticalStackView.addArrangedSubview(button3)
        
        _ = titleView.constraintsTo(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil)
        
        titleView.setSize(width: nil, height: view.bounds.height / Sizes.titleViewScale)
        
        logo.centerInTheView(centerX: view.centerXAnchor, centerY: nil)
        logo.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20).isActive = true
        verticalStackView.centerInTheView(centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        
    }

}
