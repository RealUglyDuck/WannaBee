//
//  TitleView.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 06/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class TitleView: UIView {

    let separatorHeight: CGFloat = 3
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("BACK", for: .normal)
        button.setTitleColor(ColorCollection.mainColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.minimumScaleFactor = 0.1
        label.font = FontsCollection.titleFont
        label.textColor = ColorCollection.textColor
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        return label
    }()
    
    let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = ColorCollection.mainColor
        return separator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    convenience init(title: String) {
        self.init(frame: CGRect.zero)
        label.text = title
    }
    
    convenience init(title: NSMutableAttributedString){
        self.init(frame: CGRect.zero)
        label.attributedText = title
    }
    
    func setupViews() {
        addSubview(label)
        addSubview(separator)
        addSubview(backButton)
        
        _ = backButton.constraintWithDistanceTo(top: topAnchor, leading: leadingAnchor, trailing: nil, bottom: nil, topDistance: 10, leftDistance: 10, rightDistance: 0, bottomDistance: 0)

        label.centerInTheView(centerX: centerXAnchor, centerY: nil)
        label.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -10).isActive = true
        _ = separator.constraintWithDistanceTo(top: nil, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, topDistance: 0, leftDistance: 20, rightDistance: 20, bottomDistance: 0)
        separator.setSize(width: nil, height: separatorHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
