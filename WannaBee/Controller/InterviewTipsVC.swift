//
//  InterviewTipsVC.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 17/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class InterviewTipsVC: UIViewController {
    
    let titleView = TitleView(title: "Interview Tips")

    let greetingButton = PolygonButton(imageName: ImageDatabase.generalButtonImage, buttonTitle: "Greeting")
    let dresscodeButton = PolygonButton(imageName: ImageDatabase.generalButtonImage, buttonTitle: "Dresscode")
    let bodyLanguageButton = PolygonButton(imageName: ImageDatabase.generalButtonImage, buttonTitle: "Body Language")
    let phoneInterviewButton = PolygonButton(imageName: ImageDatabase.generalButtonImage, buttonTitle: "Phone Interview")
    let videoInterviewButton = PolygonButton(imageName: ImageDatabase.generalButtonImage, buttonTitle: "VideoInteview")
    
    lazy var stackView = ButtonsStack(buttons: [greetingButton,dresscodeButton,bodyLanguageButton,videoInterviewButton])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        titleView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupViews() {
        view.addSubview(titleView)
        view.addSubview(stackView)
        
        view.backgroundColor = ColorCollection.backgroundColor
        
        _ = titleView.constraintsTo(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil)
        
        titleView.setSize(width: nil, height: view.bounds.height / Sizes.titleViewScale)
        
        stackView.centerInTheView(centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }


}
